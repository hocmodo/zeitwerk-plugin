---
name: invoicing
description: Create, track, and manage invoices in Zeitwerk. Use when creating invoices, checking what is unpaid or overdue, marking invoices as paid, or downloading invoice PDFs.
user-invocable: false
---

# Invoicing Skill

## Purpose
Create, track, and manage invoices based on logged time in Zeitwerk.

## When this skill activates
- User asks to create, check, or update an invoice
- User asks what's unpaid or overdue
- User marks an invoice as paid

## IMPORTANT: How to access Zeitwerk data
You have access to the Zeitwerk MCP server which provides the following tools:
- `get_status` — dashboard summary
- `get_customers` — list all customers
- `create_customer` — create a new customer (required: name; optional: contact, address, tax_id)
- `update_customer` — update a customer (required: id)
- `get_projects` — list all projects (optional: customer_id filter)
- `create_project` — create a new project (required: name, customer_id, rate)
- `update_project` — update a project (required: id)
- `get_time_entries` — fetch entries (required: from, to as YYYY-MM-DD; optional: project_id)
- `create_time_entry` — log new entry (required: project_id, hours, date; optional: description)
- `update_time_entry` — edit entry (required: id)
- `delete_time_entry` — soft delete (required: id)
- `get_invoices` — list invoices (optional: status filter: 'unpaid' or 'paid')
- `create_invoice` — create invoice with line items (required: customer_id, invoice_date)
- `update_invoice` — update invoice, e.g. mark paid (required: id, status)
- `get_invoice_pdf` — download invoice as PDF (required: id)
- `import_time_entries` — import entries from .xlsx/.xls/.csv (required: file_path, project_id)

Always call these MCP tools directly. Never use bash, curl, or any other method.

## Workflows

### Check outstanding invoices
Call `get_invoices` with status="unpaid"
Flag any where due_date < today as overdue

### Create an invoice
1. Call `get_customers` to resolve customer name to id
2. Call `get_time_entries` for the period to find unbilled time for that customer
3. Group by project to build line items
4. Show draft summary table and ask user to confirm
5. Only after confirmation: call `create_invoice` with line items
6. Never create an invoice without user confirmation

### Mark as paid
Call `update_invoice` with id and status="paid"
Confirm: > ✓ Invoice 2026-042 marked as paid.

### Download invoice PDF
Call `get_invoice_pdf` with the invoice id
Tell the user the file was saved to the path returned in `saved_to`

### Invoice number format
Use YYYY-NNN (e.g. 2026-042)
Call `get_invoices` first, find highest number for current year, increment by 1

## Best practices
- Always show draft before creating
- Default payment terms: net 30 days
- Warn if there's unbilled time outside the selected period
