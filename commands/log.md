# /zeitwerk:log

Log a time entry to Zeitwerk.

## Usage
```
/zeitwerk:log [duration] on [project] — [description]
```

## Examples
- `/zeitwerk:log 2h on Website Redesign — fixed nav bug`
- `/zeitwerk:log 9am-11:30 on Mobile App — sprint planning`
- `/zeitwerk:log 45min on Admin — invoicing`

## IMPORTANT: How to access Zeitwerk data
You have access to the Zeitwerk MCP server. Always call MCP tools directly. Never use bash, curl, or REST calls.

## Steps
1. Parse hours and date from input (default date = today)
2. Call `get_projects` and fuzzy-match the project name
3. If ambiguous, show matches and ask user to pick
4. Call `create_time_entry` with project_id, hours, date, description
5. Confirm with the returned entry data

## Output
> ✓ Logged **2h** on **Website Redesign** (Acme Corp) — today = $300.00
