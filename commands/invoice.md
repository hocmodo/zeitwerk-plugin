# /zeitwerk:invoice

Create or manage invoices.

## Usage
```
/zeitwerk:invoice [action] [target]
```

## IMPORTANT: How to access Zeitwerk data
You have access to the Zeitwerk MCP server. Always call MCP tools directly. Never use bash, curl, or REST calls.

## Actions

### create
```
/zeitwerk:invoice create [customer] [period]
```
Examples:
- `/zeitwerk:invoice create Acme Corp this month`
- `/zeitwerk:invoice create Beta Labs March 2026`

Steps:
1. Call `get_customers` — resolve customer name to id
2. Call `get_time_entries` with from/to dates — find unbilled time for that customer
3. Show draft summary and ask for confirmation
4. Only after confirmation: call `create_invoice` with line items

### status
```
/zeitwerk:invoice status
```
Call `get_invoices` with status="unpaid" — show all outstanding invoices, marking the ones with `overdue: true`.

### paid
```
/zeitwerk:invoice paid 2026-042
```
Call `get_invoices` to find the invoice by invoice_number, then:
Call `update_invoice` with id and status="paid" (and `paid_date` if the user gives the payment date)
