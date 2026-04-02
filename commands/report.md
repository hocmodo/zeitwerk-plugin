# /zeitwerk:report

Generate a timesheet or earnings report.

## Usage
```
/zeitwerk:report [period] [--customer name]
```

## Examples
- `/zeitwerk:report this week`
- `/zeitwerk:report last month --customer Acme Corp`
- `/zeitwerk:report today`

## IMPORTANT: How to access Zeitwerk data
You have access to the Zeitwerk MCP server. Always call MCP tools directly. Never use bash, curl, or REST calls.

## Steps
1. Parse the period into a from/to date range
2. Call `get_time_entries` with from and to dates
3. If --customer specified, filter results by customer_name
4. Group by date and project, sum hours and amount
5. Present as a formatted table with totals

## Supported periods
- `today`, `yesterday`
- `this week`, `last week`
- `this month`, `last month`
- `Q1`, `Q2`, `Q3`, `Q4`
- Custom: `2026-03-01 to 2026-03-31`
