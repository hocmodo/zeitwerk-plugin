# /zeitwerk:status

Quick freelancer dashboard — at-a-glance snapshot of where things stand.

## Usage
```
/zeitwerk:status
```

## IMPORTANT: How to access Zeitwerk data
You have access to the Zeitwerk MCP server. Always call MCP tools directly. Never use bash, curl, or REST calls.

## Steps
1. Call `get_status` — returns pre-aggregated summary data
2. Call `get_invoices` with status="unpaid" — for outstanding invoice details
3. Format and present the results

## GET /status response fields
- today_hours
- week_hours
- month_hours
- month_earnings
- unpaid_invoice_count
- unpaid_invoice_total

## Output format

> **Zeitwerk — 28 March 2026**
>
> **Today:** 3.5h
> **This week:** 18.5h
> **This month:** 62h — $9,300 earned
>
> **Outstanding invoices:** 2 · $6,200 total
>   ⚠️ INV-2026-039 — $1,800 — overdue 5 days
>
> *Tip: Try /zeitwerk:report this month for a full breakdown.*
