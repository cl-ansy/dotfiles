#!/usr/bin/env bash
# tuios after-agent-state hook: desktop notification when an agent pane needs
# you or finished. The daemon runs this with nobody attached, so it works while
# you are in another app. The Inbox (prefix i) holds the actual question; this
# only names the pane.
#
# Env from tuios: TUIOS_AGENT_STATE, TUIOS_AGENT_PREV_STATE, TUIOS_AGENT_HARNESS,
# TUIOS_AGENT_MESSAGE, TUIOS_WINDOW_ID, TUIOS_WINDOW_NAME, TUIOS_SESSION_ID.
# ALERT_DRY_RUN=1 prints instead of notifying.

state="${TUIOS_AGENT_STATE:-}"
pane="${TUIOS_SESSION_ID:-?}/${TUIOS_WINDOW_NAME:-${TUIOS_WINDOW_ID:0:8}}"
message="${TUIOS_AGENT_MESSAGE:-}"

# A worker pane (a reviewer, a dev) finishing a turn is internal to its
# orchestrator; only an orchestrator pane finishing is worth a notification,
# since that is when there is a report or a question. Orchestrator panes are
# named "watch ..." or "work ..." (tuios-review-orchestrator, tuios-work-orchestrator).
case "$state" in
  needs_input) subtitle="Needs you" ;;
  errored)     subtitle="Errored" ;;
  done)
    case "${TUIOS_WINDOW_NAME:-}" in
      watch*|work*) subtitle="Finished" ;;
      *) exit 0 ;;
    esac ;;
  *)           exit 0 ;;
esac

title="tuios · $pane"
body="${message:-$subtitle}"
[ "${#body}" -gt 160 ] && body="${body:0:157}..."

if [ -n "${ALERT_DRY_RUN:-}" ]; then
  printf 'title:    %s\nsubtitle: %s\nbody:     %s\n' "$title" "$subtitle" "$body"
  exit 0
fi

if command -v terminal-notifier >/dev/null 2>&1; then
  # -group replaces the previous notification for the same pane instead of stacking.
  terminal-notifier -title "$title" -subtitle "$subtitle" -message "$body" \
    -group "tuios-${TUIOS_WINDOW_ID:-$pane}" >/dev/null 2>&1
elif command -v osascript >/dev/null 2>&1; then
  safe_body="${body//\\/}"; safe_body="${safe_body//\"/}"
  safe_title="${title//\"/}"
  osascript -e "display notification \"$safe_body\" with title \"$safe_title\" subtitle \"$subtitle\"" >/dev/null 2>&1
elif command -v notify-send >/dev/null 2>&1; then
  notify-send "$title" "$subtitle: $body"
fi
exit 0
