# Reporting Skill

## Purpose
Generate timesheet and billing reports from Zeitwerk.

## When this skill activates
- User asks for a summary, report, or breakdown of time
- User asks about earnings or hours worked
- User mentions any time period with a reporting intent

## IMPORTANT: How to access Zeitwerk data
You have access to the Zeitwerk MCP server which provides the following tools:
- `get_status` — dashboard summary (today/week/month hours and earnings, outstanding invoices)
- `get_time_entries` — fetch entries (required: from, to as YYYY-MM-DD; optional: project_id)
- `get_customers` — list all customers
- `get_projects` — list all projects (optional: customer_id filter)

Always call these MCP tools directly. Never use bash, curl, or any other method.
Call `get_time_entries` with from/to dates to fetch data, then aggregate in your response.

## Workflow
1. Parse the period into from/to dates (YYYY-MM-DD)
2. Call `get_time_entries` with those dates
3. Optionally filter by customer name if --customer was specified
4. Group results by date and project, sum hours and amount
5. Present as a formatted table with totals

## Date ranges
- today: from=today, to=today
- this week: from=Monday of current week, to=today
- this month: from=first of current month, to=today
- last month: from=first of last month, to=last day of last month

## Formatting
- Round hours to 2 decimal places
- Show amounts with $ prefix
- Always state the time period at the top
- Include totals row

## Example output

**Weekly Timesheet — 24–30 March 2026**

| Date    | Project          | Customer  | Hours  | Earned   |
|---------|-----------------|-----------|--------|----------|
| Mon 24  | Website Redesign | Acme Corp | 3.50h  | $525.00  |
| **Total** |               |           | **32h** | **$4,200** |
