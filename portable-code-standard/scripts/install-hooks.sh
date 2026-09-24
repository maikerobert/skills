#!/usr/bin/env bash
# Installs the local Git hooks that run the portability check.
# Usage: bash scripts/install-hooks.sh   (once per machine)
# If the check script lives somewhere other than scripts/, pass its path relative to the repository root:
#   bash path/to/install-hooks.sh path/to/check-portability.sh

set -e
git rev-parse --show-toplevel >/dev/null
CHECK="${1:-scripts/check-portability.sh}"
HOOKS="$(git rev-parse --git-path hooks)"
mkdir -p "$HOOKS"

for h in pre-commit commit-msg; do
  if [ -f "$HOOKS/$h" ] && ! grep -q "check-portability" "$HOOKS/$h"; then
    cp "$HOOKS/$h" "$HOOKS/$h.previous"
    echo "Existing $h hook saved as $h.previous."
  fi
done

cat > "$HOOKS/pre-commit" <<EOF
#!/usr/bin/env bash
exec bash "\$(git rev-parse --show-toplevel)/$CHECK"
EOF

cat > "$HOOKS/commit-msg" <<EOF
#!/usr/bin/env bash
exec bash "\$(git rev-parse --show-toplevel)/$CHECK" --message "\$1"
EOF

chmod +x "$HOOKS/pre-commit" "$HOOKS/commit-msg"
echo "Hooks installed in $HOOKS (pre-commit and commit-msg), running $CHECK."
