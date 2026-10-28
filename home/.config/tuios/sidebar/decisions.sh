#!/usr/bin/env bash
# Rows for the rail's custom section: the decisions the orchestrators are
# waiting on you for. Two lines per item: the thing and its verdict or
# question, then `└` the title or stage and how long it has waited. The
# section is display only (tuios gives custom rows no click); answer in the
# orchestrator's pane, or with r on its finished-turn row in the Inbox.
#
# Read from the orchestrators' state files, so a row clears only when you
# answer (post, skip, approve, drop, commit), not when you read the mail:
#   ~/.claude/review-watch/tuios.json  "awaiting"  (tuios-review-orchestrator)
#   ~/.claude/work/index.json          "asking"    (tuios-work-orchestrator)
#
# Polled every few seconds by tuios ([appearance.sidebar.custom]). Prints
# nothing when nothing waits, which hides the section.

width="$(tuios get-config appearance.sidebar.width 2>/dev/null || echo 48)"

WIDTH="$width" python3 -I -c '
import json, os, re, time
from datetime import datetime
from pathlib import Path

HOME = Path.home()
REVIEW_STATE = HOME / ".claude/review-watch/tuios.json"
WORK_STATE = HOME / ".claude/work/index.json"

WORK_QUESTION = {
    "plan": "approve the plan?",
    "decision": "continue or drop?",
    "ready": "commit?",
}

width = max(20, int(os.environ.get("WIDTH", "48")) - 4)
now = time.time()

def cut(s, n):
    return s if len(s) <= n else s[: n - 1] + "…"

def age(iso):
    if not iso:
        return ""
    try:
        secs = max(0, int(now - datetime.fromisoformat(iso.replace("Z", "+00:00")).timestamp()))
    except Exception:
        return ""
    if secs < 60:
        return f"{secs}s"
    if secs < 3600:
        return f"{secs // 60}m"
    return f"{secs // 3600}h"

def load(path):
    try:
        return json.loads(path.read_text())
    except Exception:
        return {}

def emit(summary, detail, when):
    print(cut(f"> {summary}", width))
    tail = f"  └ {detail}" if detail else "  └"
    room = width - len(when) - 2 if when else width
    tail = cut(tail, room)
    if when:
        tail = tail.ljust(width - len(when)) + when
    print(tail)

review = load(REVIEW_STATE)
for key in review.get("awaiting") or []:
    entry = (review.get("reviewed") or {}).get(key, {})
    verdict = ""
    if entry.get("draft"):
        try:
            m = re.search(r"^## Event:\s*(\S+)", Path(entry["draft"]).read_text(), re.M)
            verdict = m.group(1) if m else ""
        except Exception:
            pass
    short = key.split("/", 1)[-1]
    emit(f"{short}: {verdict}" if verdict else short, entry.get("title") or "review draft", age(entry.get("at")))

work = load(WORK_STATE)
tickets = work.get("tickets") or {}
for key in work.get("asking") or []:
    t = tickets.get(key, {})
    question = WORK_QUESTION.get(t.get("question") or "", "waiting on you")
    emit(f"{key}: {question}", t.get("stage") or "", age(t.get("asked") or t.get("updated")))
'
