# ralphbox2

A tiny dashboard built entirely by a **Ralph Loop** — an autonomous agent loop where Claude Code iterates through a backlog of stories, one per session, with no memory between runs except the files on disk.

## What It Built

A single-file dashboard (`index.html`) with:

- **Live clock** — updates every second (HH:MM:SS)
- **Counter widget** — increment/decrement with pill buttons
- **Dark/light theme toggle** — persisted via `localStorage`
- **Fade-in animation** on page load

No dependencies. No build step. Just one HTML file.

## Run It

```bash
open index.html
```

Or drag it into any browser.

## How the Ralph Loop Works

`ralph.sh` runs Claude Code in a loop. Each iteration, Claude reads `CLAUDE.md` (the spec and rules) and `progress.md` (what's done), implements exactly one story, commits it, and updates progress. When all stories are complete, it emits `RALPH_COMPLETE` and the loop exits.

```bash
./ralph.sh                    # run with default 5 iterations
./ralph.sh --max-iterations 3 # or set a custom limit
```

### The loop in brief

1. Claude reads `progress.md` to find the next story
2. Implements the story in `index.html`
3. Commits with `ralph: story N - <description>`
4. Updates `progress.md` and exits
5. `ralph.sh` checks for `RALPH_COMPLETE`; if not found, loops

## Project Structure

```
index.html    — the dashboard (the output)
CLAUDE.md     — spec + rules that drive the loop
progress.md   — tracks completed stories
ralph.sh      — the loop runner script
```
