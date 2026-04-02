# Zeitwerk Plugin for Claude Cowork

A Claude Cowork plugin for [Zeitwerk](https://apps.apple.com/nl/app/zeitwerk/id6758670741?l=en-GB&mt=12) — timesheet management for freelancers. Log time, manage projects and clients, generate reports, and track invoices, all from natural language in Cowork.

## Requirements

- [Zeitwerk](https://apps.apple.com/nl/app/zeitwerk/id6758670741?l=en-GB&mt=12) desktop app (running locally)
- [Zeitwerk MCP Server](https://github.com/hocmodo/zeitwerk-mcp-server) extension installed in Claude Cowork

## Installation

1. Install the [Zeitwerk MCP Server](https://github.com/hocmodo/zeitwerk-mcp-server) extension and configure your API token.
2. Install this plugin in Claude Cowork.
3. Start Zeitwerk and open a Cowork session.

## Commands

| Command | Description |
|---------|-------------|
| `/zeitwerk:log` | Log a time entry |
| `/zeitwerk:report` | Generate a timesheet or earnings report |
| `/zeitwerk:invoice` | Create and manage invoices |
| `/zeitwerk:status` | Quick dashboard snapshot |

### Examples

```
/zeitwerk:log 2h on Website Redesign — fixed nav bug
/zeitwerk:log 9am-11:30 on Mobile App — sprint planning

/zeitwerk:report this week
/zeitwerk:report last month --customer Acme Corp

/zeitwerk:invoice create Acme Corp this month
/zeitwerk:invoice paid 2026-042

/zeitwerk:status

Natural language:

Can you import all excel timesheets in this directory into Zeitwerk?

I worked on the Acme Corp proposal for 3 hours this morning.
Log 45 minutes on Admin — team standup.
I spent half a day on the Beta Labs API integration yesterday.

How many hours did I work this week?
What did I earn last month?
Give me a full breakdown of my time for Q1.

Do I have any overdue invoices?
Create an invoice for Beta Labs for all unbilled work in March.
Mark invoice 2026-039 as paid.

Add a new client called Gamma Inc with contact info finance@gamma.io.
Create a project for Acme Corp called Mobile App v2 at €120 per hour.
Update the rate for the Website Redesign project to €150/hour.
```

## License

MIT
