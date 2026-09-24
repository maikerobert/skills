#!/usr/bin/env bash
# Portability check (Portable Code Standard)
#
# Usage:
#   bash scripts/check-portability.sh                   check files staged for commit
#   bash scripts/check-portability.sh --all             check every tracked file
#   bash scripts/check-portability.sh --message FILE    check a commit message
#
# Optional config: a .portability file at the repository root, one rule per line:
#   name: supabase          block one more name (same logic as the AI tool names)
#   phrase: my pattern      block one more regular expression (case-insensitive)
#   ignore: src/llm/**      ignore a path (Git pathspec glob)
# Lines starting with # are comments.

MODE="staged"
MESSAGE_FILE=""
case "${1:-}" in
  --all) MODE="all" ;;
  --message) MODE="message"; MESSAGE_FILE="${2:-}" ;;
  "") ;;
  *) echo "Usage: $0 [--all | --message FILE]"; exit 2 ;;
esac

ROOT="$(git rev-parse --show-toplevel 2>/dev/null)" || { echo "Run this inside a Git repository."; exit 2; }
cd "$ROOT" || exit 2

NAMES=(manus claude chatgpt lovable copilot)
PHRASES=(
  'generated (by|with) (ai|an ai|manus|claude|chatgpt|gpt|copilot|lovable)'
  'written (by|with) (ai|an ai|manus|claude|chatgpt|gpt|copilot|lovable)'
  'ai[- ]generated'
  'gerad[oa] (por|pel[oa]|com) (ia|a ia|ai|manus|claude|chatgpt|gpt|copilot|lovable)'
  'criad[oa] (por|pel[oa]|com a ajuda d[aoe]) (ia|a ia|ai|manus|claude|chatgpt|gpt|copilot|lovable)'
  'co-authored-by:.*(claude|chatgpt|copilot|manus|lovable|openai|anthropic)'
)
SECRETS=(
  'AKIA[0-9A-Z]{16}'
  '-----BEGIN [A-Z ]*PRIVATE KEY-----'
  'sk-(proj-|ant-)?[A-Za-z0-9_-]{20,}'
  'gh[pousr]_[A-Za-z0-9]{36}'
  'github_pat_[A-Za-z0-9_]{22,}'
  'xox[abprs]-[A-Za-z0-9-]{10,}'
  'AIza[0-9A-Za-z_-]{35}'
)
IGNORED=(':(exclude).portability' ':(exclude)**/check-portability.sh' ':(exclude)**/portability.example')

if [ -f .portability ]; then
  while IFS= read -r line || [ -n "$line" ]; do
    line="${line%%$'\r'}"
    case "$line" in
      ''|'#'*) ;;
      name:*) v="${line#name:}"; v="$(echo "$v" | xargs)"; [ -n "$v" ] && NAMES+=("$(echo "$v" | tr '[:upper:]' '[:lower:]')") ;;
      phrase:*) v="${line#phrase:}"; v="$(echo "$v" | xargs)"; [ -n "$v" ] && PHRASES+=("$v") ;;
      ignore:*) v="${line#ignore:}"; v="$(echo "$v" | xargs)"; [ -n "$v" ] && IGNORED+=(":(exclude,glob)$v") ;;
    esac
  done < .portability
fi

# Each name is matched in three forms: lowercase, Capitalized (including inside camelCase)
# and UPPERCASE, plus as an isolated word in any casing (ChatGPT, Claude.ai).
# "manuscript" does not match; "ManusAuthProvider", "manus_client" and "createManusClient" do.
NAME_PATTERNS=()
WORD_PATTERNS=()
for n in "${NAMES[@]}"; do
  cap="$(echo "${n:0:1}" | tr '[:lower:]' '[:upper:]')${n:1}"
  up="$(echo "$n" | tr '[:lower:]' '[:upper:]')"
  NAME_PATTERNS+=("(^|[^A-Za-z])${n}([^a-z]|\$)" "(^|[^A-Z])${cap}([^a-z]|\$)" "(^|[^A-Z])${up}([^A-Z]|\$)")
  WORD_PATTERNS+=("(^|[^A-Za-z])${n}([^A-Za-z]|\$)")
done

NAME_ARGS=(); for p in "${NAME_PATTERNS[@]}"; do NAME_ARGS+=(-e "$p"); done
WORD_ARGS=(); for p in "${WORD_PATTERNS[@]}"; do WORD_ARGS+=(-e "$p"); done
PHRASE_ARGS=(); for p in "${PHRASES[@]}"; do PHRASE_ARGS+=(-e "$p"); done
SECRET_ARGS=(); for p in "${SECRETS[@]}"; do SECRET_ARGS+=(-e "$p"); done

FAILED=0

if [ "$MODE" = "message" ]; then
  [ -f "$MESSAGE_FILE" ] || { echo "Commit message file not found: $MESSAGE_FILE"; exit 2; }
  MSG="$(grep -v '^#' "$MESSAGE_FILE")"
  HITS="$( { echo "$MSG" | grep -n -E "${NAME_ARGS[@]}"; echo "$MSG" | grep -n -i -E "${WORD_ARGS[@]}"; echo "$MSG" | grep -n -i -E "${PHRASE_ARGS[@]}"; } | sort -u )"
  if [ -n "$HITS" ]; then
    echo "Commit message blocked (rule 1, neutral authorship):"
    echo "$HITS" | sed 's/^/  /'
    echo "Describe the change without naming an AI tool."
    exit 1
  fi
  exit 0
fi

if [ "$MODE" = "staged" ]; then
  GREP=(git grep --cached -n -I)
  FILES=()
  while IFS= read -r f; do [ -n "$f" ] && FILES+=("$f"); done <<EOF_FILES
$(git diff --cached --name-only --diff-filter=ACMR)
EOF_FILES
  [ "${#FILES[@]}" -eq 0 ] && exit 0
  TARGET=(-- "${FILES[@]}" "${IGNORED[@]}")
  FILE_LIST="$(printf '%s\n' "${FILES[@]}")"
else
  GREP=(git grep -n -I)
  TARGET=(-- . "${IGNORED[@]}")
  FILE_LIST="$(git ls-files)"
fi

report() {
  local title="$1"; shift
  local output
  output="$("$@" 2>/dev/null)"
  if [ -n "$output" ]; then
    echo "$title"
    echo "$output" | head -50 | sed 's/^/  /'
    FAILED=1
  fi
}

NAME_HITS="$( { "${GREP[@]}" -E "${NAME_ARGS[@]}" "${TARGET[@]}"; "${GREP[@]}" -i -E "${WORD_ARGS[@]}" "${TARGET[@]}"; } 2>/dev/null | sort -u )"
report "Rule 1 (neutral authorship): AI tool name in the code" echo -n "$NAME_HITS"
report "Rule 1 (neutral authorship): AI authorship phrase" "${GREP[@]}" -i -E "${PHRASE_ARGS[@]}" "${TARGET[@]}"
report "Rule 3 (secrets): possible key or credential" "${GREP[@]}" -E "${SECRET_ARGS[@]}" "${TARGET[@]}"

ENV_FILES="$(printf '%s\n' "$FILE_LIST" | grep -E '(^|/)\.env(\..+)?$' | grep -v -E '\.env\.(example|sample|template)$')"
if [ -n "$ENV_FILES" ]; then
  echo "Rule 3 (secrets): .env file under version control"
  echo "$ENV_FILES" | sed 's/^/  /'
  FAILED=1
fi

if [ "$FAILED" -ne 0 ]; then
  echo
  echo "Portability check failed. Fix the items above."
  echo "If a match is legitimate (for example, a module that integrates an AI API on purpose), add its path to .portability with 'ignore:'."
  exit 1
fi
echo "Portability check: ok."
exit 0
