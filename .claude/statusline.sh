#!/bin/bash
input=$(cat)

PYTHON_SCRIPT='import json, os
try:
    data = json.loads(os.environ.get("STATUSLINE_INPUT", "{}"))
except Exception:
    data = {}
model = ((data.get("model") or {}).get("display_name")) or "unknown"
current_dir = ((data.get("workspace") or {}).get("current_dir")) or ""
cost = ((data.get("cost") or {}).get("total_cost_usd")) or 0
pct = ((data.get("context_window") or {}).get("used_percentage")) or 0
duration_ms = ((data.get("cost") or {}).get("total_duration_ms")) or 0
print(model)
print(current_dir)
print(cost)
print(int(float(pct)))
print(int(duration_ms))'

if command -v python3 >/dev/null 2>&1; then
  PARSED=$(STATUSLINE_INPUT="$input" python3 -c "$PYTHON_SCRIPT")
elif command -v python >/dev/null 2>&1; then
  PARSED=$(STATUSLINE_INPUT="$input" python -c "$PYTHON_SCRIPT")
elif command -v py >/dev/null 2>&1; then
  PARSED=$(STATUSLINE_INPUT="$input" py -3 -c "$PYTHON_SCRIPT")
else
  echo 'python not found'
  exit 0
fi

MODEL=$(printf '%s
' "$PARSED" | sed -n '1p')
DIR=$(printf '%s
' "$PARSED" | sed -n '2p')
COST=$(printf '%s
' "$PARSED" | sed -n '3p')
PCT=$(printf '%s
' "$PARSED" | sed -n '4p')
DURATION_MS=$(printf '%s
' "$PARSED" | sed -n '5p')

CYAN='\033[36m'; GREEN='\033[32m'; YELLOW='\033[33m'; RED='\033[31m'; RESET='\033[0m'

if [ "$PCT" -ge 90 ]; then BAR_COLOR="$RED"
elif [ "$PCT" -ge 70 ]; then BAR_COLOR="$YELLOW"
else BAR_COLOR="$GREEN"; fi

FILLED=$((PCT / 10)); EMPTY=$((10 - FILLED))
printf -v FILL "%${FILLED}s"; printf -v PAD "%${EMPTY}s"
BAR="${FILL// /█}${PAD// /░}"

MINS=$((DURATION_MS / 60000)); SECS=$(((DURATION_MS % 60000) / 1000))

BRANCH=""
git rev-parse --git-dir > /dev/null 2>&1 && BRANCH=" | 🌿 $(git branch --show-current 2>/dev/null)"

echo -e "${CYAN}[$MODEL]${RESET} 📁 ${DIR##*/}$BRANCH"
COST_FMT=$(printf '$%.2f' "$COST")
echo -e "${BAR_COLOR}${BAR}${RESET} ${PCT}% | ${YELLOW}${COST_FMT}${RESET} | ⏱️ ${MINS}m ${SECS}s"