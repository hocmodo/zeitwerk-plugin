---
name: time-logging
description: Log, view, edit, and import time entries in Zeitwerk, and control the in-app timer. Use when starting or stopping the timer, logging time, recording work hours, importing xlsx/xls/csv timesheets, asking what was logged today or this week, or editing/deleting a time entry.
user-invocable: false
---

# Time Logging Skill

## Purpose
Help freelancers log time entries into Zeitwerk using natural language.

## When this skill activates
- User wants to start or stop the in-app timer
- User mentions logging time, recording work, or "I worked on..."
- User asks what they've logged today, this week, or for a project
- User wants to edit or delete a time entry
- **User wants to import time entries from a file (.xlsx, .xls, .csv) into Zeitwerk**
- User mentions files in a directory that look like timesheets or time logs

## CRITICAL: Importing time entries — never create intermediate files or scripts
When importing time entries, **always pass the original source file directly to `import_time_entries`**.
- Supported formats: `.xlsx`, `.xls`, `.csv` — prefer `.xlsx`
- **NEVER write a Python script, use openpyxl, pandas, or any other library to parse the file yourself.**
- **NEVER convert, transform, or write an intermediate file first.** Do not create a CSV from an xlsx, do not rewrite the file in any way.
- **NEVER loop through rows manually and call `create_time_entry` for each row.** Use `import_time_entries` instead.
- The `import_time_entries` MCP tool handles all parsing internally — trust it to read the file.
- Only involve file transformation if the user explicitly asks for data changes that cannot be expressed in the import call itself.

## IMPORTANT: How to access Zeitwerk data
Always use the Zeitwerk MCP tools. Never use bash, curl, or any other method.
The available tools are:
- `start_timer` — start the in-app timer for a project (required: project_id; optional: description)
- `stop_timer` — stop the running timer and save the elapsed time as a time entry
- `get_status` — dashboard summary
- `get_customers` — list customers
- `create_customer` — create a new customer (required: name)
- `get_projects` — list projects (optional customer_id filter)
- `create_project` — create a new project (required: name, customer_id, rate)
- `get_time_entries` — entries for a date range (required: from, to as YYYY-MM-DD)
- `create_time_entry` — log new entry (required: project_id, hours, date; optional: description)
- `update_time_entry` — edit entry (required: id)
- `delete_time_entry` — soft delete (required: id)
- `get_invoices` — list invoices (optional: status 'unpaid'/'paid'/'overdue', customer_id, from, to)
- `get_invoice` — one invoice with its line items (required: id)
- `create_invoice` — create invoice with line items
- `update_invoice` — mark paid (optional paid_date) or unpaid
- `delete_invoice` — delete an invoice (required: id; confirm first)
- `get_invoice_pdf` — download invoice as PDF (required: id)
- `import_time_entries` — import entries from .xlsx/.xls/.csv file (required: file_path, project_id)

## Workflow for starting the timer
1. Call `get_projects` (and `get_customers` if needed) to resolve the project — fuzzy match the user's input
2. If multiple matches, show them and ask user to pick
3. Call `start_timer` with project_id and optional description
4. Confirm back: > ▶ Timer started on **Project Name** (Customer) — HH:MM

## Workflow for stopping the timer
1. Call `stop_timer` — no parameters required
2. Confirm back with the saved entry: > ■ Timer stopped — logged **Xh** on **Project Name** (Customer)

## Workflow for logging time
1. Call `get_projects` to find the project — fuzzy match the user's project name
2. If multiple matches, show them and ask user to pick
3. Call `create_time_entry` with project_id, hours, date, description
4. Confirm back to user with the returned entry data

## Workflow for importing time entries
1. Call `get_projects` to resolve the target project to a project_id
2. Use the original source file as-is — do **not** create any intermediate or converted file
3. Call `import_time_entries` with the absolute `file_path` and `project_id`
4. Report back the number of imported entries and any warnings or errors returned

## Parsing natural language hours
- "2 hours" → 2.0
- "1.5h" / "90 minutes" → 1.5
- "half a day" → 4.0
- "9am to 11:30" → 2.5
- No date specified → today (YYYY-MM-DD format)

## Confirm back to user
> ✓ Logged **2.5h** on **Website Redesign** (Acme Corp) — today = $375.00
