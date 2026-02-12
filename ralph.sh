#!/usr/bin/env bash
set -euo pipefail

# ── Ralph Loop (DIY) ────────────────────────────────────────
# Usage: ./ralph.sh [--max-iterations N]
# Default max iterations: 5

MAX_ITER=5
COMPLETION_PROMISE="RALPH_COMPLETE"

while [[ $# -gt 0 ]]; do
  case $1 in
    --max-iterations) MAX_ITER="$2"; shift 2 ;;
    *) echo "Unknown flag: $1"; exit 1 ;;
  esac
done

PROMPT=$(cat CLAUDE.md)
ITER=0

echo "╔══════════════════════════════════════╗"
echo "║        RALPH LOOP — DIY POC         ║"
echo "║  Max iterations: $MAX_ITER                   ║"
echo "╚══════════════════════════════════════╝"
echo ""

while [ "$ITER" -lt "$MAX_ITER" ]; do
  ITER=$((ITER + 1))
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "  ITERATION $ITER / $MAX_ITER"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo ""

  # Run Claude in headless (print) mode with the prompt.
  # --verbose shows tool use so you can watch it work.
  OUTPUT=$(claude -p "$PROMPT" --verbose --dangerously-skip-permissions 2>&1) || true

  echo "$OUTPUT"
  echo ""

  # Check for completion promise
  if echo "$OUTPUT" | grep -qF "$COMPLETION_PROMISE"; then
    echo "╔══════════════════════════════════════╗"
    echo "║   RALPH_COMPLETE — Loop finished!    ║"
    echo "╚══════════════════════════════════════╝"
    exit 0
  fi

  echo "[ralph] Iteration $ITER done. Looping..."
  echo ""
done

echo "╔══════════════════════════════════════╗"
echo "║   Max iterations reached ($MAX_ITER).        ║"
echo "║   Check progress.md for status.      ║"
echo "╚══════════════════════════════════════╝"
