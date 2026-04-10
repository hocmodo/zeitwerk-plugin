# /zeitwerk:timer

Start or stop the in-app Zeitwerk timer.

## Usage
```
/zeitwerk:timer start [project] — [description]
/zeitwerk:timer stop
```

## Examples
- `/zeitwerk:timer start Website Redesign — working on dark mode`
- `/zeitwerk:timer start Mobile App — sprint planning`
- `/zeitwerk:timer stop`

## IMPORTANT: How to access Zeitwerk data
You have access to the Zeitwerk MCP server. Always call MCP tools directly. Never use bash, curl, or REST calls.

## Start timer

Steps:
1. Call `get_customers` and `get_projects` to resolve the project — fuzzy match the user's input
2. If ambiguous, show matches and ask user to pick
3. Call `start_timer` with project_id and description
4. Confirm with the start time returned

Output:
> ▶ Timer started on **Website Redesign** (Acme Corp) — 14:32

## Stop timer

Steps:
1. Call `stop_timer` — no parameters required
2. Confirm with the saved time entry details

Output:
> ■ Timer stopped — logged **1.5h** on **Website Redesign** (Acme Corp)
