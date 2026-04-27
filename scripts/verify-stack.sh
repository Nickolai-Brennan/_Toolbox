#!/usr/bin/env bash
# verify-stack.sh — checks for required tools in the development environment.
# Prints OK or MISSING for each tool, then exits 1 if any are missing.

set -euo pipefail

TOOLS=(node npm python pip docker git psql)
MISSING=0

echo "=== Stack Verification ==="
for tool in "${TOOLS[@]}"; do
  if command -v "$tool" >/dev/null 2>&1; then
    version=$("$tool" --version 2>/dev/null | head -n1 || echo "unknown")
    printf "  ✅  %-10s OK   (%s)\n" "$tool" "$version"
  else
    printf "  ❌  %-10s MISSING\n" "$tool"
    MISSING=$((MISSING + 1))
  fi
done

echo "=========================="
if [ "$MISSING" -gt 0 ]; then
  echo "Result: $MISSING tool(s) missing. Please install them before continuing."
  exit 1
else
  echo "Result: All tools present."
fi
