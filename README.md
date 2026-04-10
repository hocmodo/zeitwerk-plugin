# Zeitwerk Plugin for Claude Desktop

A Claude Desktop plugin for [Zeitwerk](http://www.hocmodo.nl) — timesheet management for freelancers. Control timers, log time, manage projects and clients, generate reports, and track invoices, all from natural language.

## Requirements

- [Zeitwerk](http://www.hocmodo.nl) desktop app (running locally on `127.0.0.1:27432`)
- [Zeitwerk MCP Server](https://github.com/hocmodo/zeitwerk-mcp-server) extension installed in Claude Desktop

## Installation

1. Install the Zeitwerk MCP Server extension from **Settings → Extensions → Browse → search "Zeitwerk"** and configure your API token.
2. Install this plugin in Claude Desktop.
3. Start Zeitwerk and open a conversation.

## Commands

| Command | Description |
|---------|-------------|
| `/zeitwerk:timer` | Start or stop the in-app timer |
| `/zeitwerk:log` | Log a time entry manually |
| `/zeitwerk:report` | Generate a timesheet or earnings report |
| `/zeitwerk:invoice` | Create and manage invoices |
| `/zeitwerk:status` | Quick dashboard snapshot |

### Examples

```
/zeitwerk:timer start Website Redesign — dark mode
/zeitwerk:timer stop

/zeitwerk:log 2h on Website Redesign — fixed nav bug
/zeitwerk:log 9am-11:30 on Mobile App — sprint planning

/zeitwerk:report this week
/zeitwerk:report last month --customer Acme Corp

/zeitwerk:invoice create Acme Corp this month
/zeitwerk:invoice paid 2026-042

/zeitwerk:status

Natural language:

Start the timer on the Acme Corp Website Redesign project — working on dark mode
Stop the timer

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
