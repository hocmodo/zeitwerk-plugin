---
name: projects-clients
description: Manage customers and projects in Zeitwerk. Use when adding, viewing, or updating a customer or project, checking project activity or earnings, or setting up a new client.
user-invocable: false
---

# Projects & Customers Skill

## Purpose
Manage the freelancer's customers and projects in Zeitwerk.

## When this skill activates
- User wants to add, create, view, or archive a project or customer
- User asks about project activity or earnings
- A time log references a project or customer that doesn't exist yet
- User asks to set up a new client or new project

## IMPORTANT: How to access Zeitwerk data
Always use the Zeitwerk MCP tools. Never use bash, curl, or any other method.
The available tools are:
- `get_customers` — list all customers
- `create_customer` — create a new customer (required: name; optional: contact, address, tax_id)
- `update_customer` — update a customer (required: id; optional: name, contact, address, tax_id)
- `get_projects` — list all projects (optional: customer_id filter)
- `create_project` — create a new project (required: name, customer_id, rate)
- `update_project` — update a project (required: id; optional: name, customer_id, rate)
- `get_time_entries` — fetch entries (required: from, to; optional: project_id)

## Workflows

### List customers
Call `get_customers` — returns id, name, contact, address, tax_id

### List projects
Call `get_projects` — optionally pass customer_id to filter
Returns: id, name, customer_id, customer_name, rate

### Project activity summary
1. Call `get_projects` to find the project id
2. Call `get_time_entries` with project_id filter to get all entries
3. Sum hours and amount, find last entry date
4. Present as a summary

### Create a customer
1. Call `get_customers` to check for duplicate names first
2. Call `create_customer` with name (required), and optionally contact, address, tax_id
3. Confirm back with the created customer's id and name

### Update a customer
Call `update_customer` with the customer id and only the fields to change
Confirm back with the updated customer object

### Create a project
1. Call `get_customers` to find the customer_id
2. Call `get_projects` to check for duplicate project names for that customer
3. Ask for the hourly rate if not provided
4. Call `create_project` with name, customer_id, and rate
5. Confirm back with the created project's id, name, and rate

### Update a project
Call `update_project` with the project id and only the fields to change
Confirm back with the updated project object

## Best practices
- Never hard delete — Zeitwerk uses soft deletes
- Warn user before archiving a project that has time entries
