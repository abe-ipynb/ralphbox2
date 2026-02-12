# Ralph Loop — Autonomous Iteration Prompt

You are running inside a ralph loop. Each invocation is a **fresh session** with no memory of prior runs. Your memory is the files on disk.

## Rules

1. **Read `progress.md` first.** It tells you what's done and what's next.
2. **Do exactly ONE story per session.** Pick the lowest-numbered incomplete story from the spec below, implement it fully, then stop.
3. **After completing the story**, update `progress.md`: mark it done, note what you built, and list the next story.
4. **If ALL stories are complete**, output exactly this on its own line and do nothing else:
   ```
   RALPH_COMPLETE
   ```
5. **Do not refactor, improve, or touch completed stories.** Only work on the current one.
6. Commit your work with a message like `ralph: story N - <description>`.

## Spec — Tiny Dashboard (single HTML file: `index.html`)

### Story 1: Skeleton
Create `index.html` with a centered card that says "Ralph Dashboard". Use inline CSS. Dark background (#1a1a2e), light card (#16213e), white text. Should look decent on mobile.

### Story 2: Live Clock
Add a live-updating clock (HH:MM:SS) inside the card. Use `setInterval` in a `<script>` tag. No external deps.

### Story 3: Counter Widget
Below the clock, add a counter with [−] 0 [+] buttons. Style them as pill buttons. Counter value displayed between them.

### Story 4: Theme Toggle
Add a toggle button in the top-right corner of the card that switches between dark mode (current) and light mode (white bg, dark card, dark text). Persist the choice in `localStorage`.

### Story 5: Final Polish
Add a subtle CSS fade-in animation on page load for the card. Add a footer inside the card: "Built by Ralph Loop 🔁". Verify everything works together. Then output `RALPH_COMPLETE`.
