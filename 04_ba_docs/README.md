# BA Documentation

This folder contains the Business Analysis documentation for the **Maven Toys Sales & Inventory Operations Optimization** portfolio project.

The documentation supports the SQL Server + Power BI dashboard by showing how the business problem, stakeholders, requirements, KPIs, use cases, Jira backlog, traceability, assumptions, and recommendations connect into one requirement-driven BI solution.

## Document Index

| File | Purpose | Best for |
|---|---|---|
| [`BRD.md`](./BRD.md) | Defines the business problem, objectives, scope, stakeholders, functional requirements, non-functional requirements, tools, and success criteria. | Understanding the overall business case and project scope |
| [`KPI_Dictionary.md`](./KPI_Dictionary.md) | Defines dashboard KPIs, formulas, source views, dashboard placement, and business interpretation. | Validating metric meaning and KPI governance |
| [`Data_Dictionary.md`](./Data_Dictionary.md) | Documents source tables, SQL views, important fields, and data interpretation notes. | Understanding data sources, joins, and analytical fields |
| [`Use_Cases.md`](./Use_Cases.md) | Describes the main dashboard use cases, actors, preconditions, postconditions, normal flows, alternatives, and exceptions. | Understanding how stakeholders use the dashboard |
| [`User_Stories_and_Acceptance_Criteria.md`](./User_Stories_and_Acceptance_Criteria.md) | Documents Jira epics, user stories, priority rationale, acceptance criteria, and selected subtask breakdown. | Reviewing Agile BA backlog structure |
| [`Requirement_Traceability_Matrix.md`](./Requirement_Traceability_Matrix.md) | Connects functional requirements to Jira epics/stories, SQL objects, Power BI pages, and evidence artifacts. | Checking requirement coverage and delivery alignment |
| [`Assumptions_and_Limitations.md`](./Assumptions_and_Limitations.md) | Clarifies assumptions, data limitations, and interpretation boundaries, especially for inventory-risk analysis. | Preventing overclaiming and supporting responsible interpretation |
| [`Business_Recommendations.md`](./Business_Recommendations.md) | Converts dashboard findings into data-driven business recommendations for inventory, store, and product stakeholders. | Reviewing action-oriented business insights |

## How the Documents Work Together

The BA documentation follows this flow:

```text
Business problem and objectives
→ BRD
→ KPI and Data Dictionaries
→ Use Cases
→ Jira Epics and User Stories
→ Requirement Traceability Matrix
→ Assumptions, Limitations, and Recommendations
```

This structure shows that the dashboard is not only a visual report. It is a decision-support solution built from documented business needs, stakeholder use cases, validated KPIs, SQL-backed logic, and actionable recommendations.

## Agile / Scrum Compatibility Note

The Jira backlog is organized using:

```text
Epic → Story → selected Subtasks
```

The project used a Kanban workflow because it was completed individually. However, the user stories and acceptance criteria are written in a Scrum-compatible format, meaning they can support backlog refinement, sprint planning, acceptance testing, and stakeholder review in a team environment.

The Requirement Traceability Matrix is included as a lightweight Agile traceability artifact. It is not intended as a heavy waterfall document. Its purpose is to show coverage between business objectives, functional requirements, Jira delivery items, SQL objects, Power BI pages, and evidence.

## Key Portfolio Signals

This folder demonstrates:

- Business requirement definition through the BRD.
- KPI governance through formula, source, and interpretation documentation.
- Data understanding through source table and SQL view documentation.
- Stakeholder thinking through use cases and role-based requirements.
- Agile BA practice through Jira epics, user stories, acceptance criteria, priorities, and selected subtasks.
- Requirement coverage through a lightweight traceability matrix.
- Responsible interpretation through documented assumptions and limitations.
- Business orientation through data-driven recommendations.

## Recommended Review Order

For a quick review:

1. Start with [`BRD.md`](./BRD.md)
2. Review [`User_Stories_and_Acceptance_Criteria.md`](./User_Stories_and_Acceptance_Criteria.md)
3. Check [`Requirement_Traceability_Matrix.md`](./Requirement_Traceability_Matrix.md)
4. Read [`Business_Recommendations.md`](./Business_Recommendations.md)

For a more detailed technical/business review:

1. [`KPI_Dictionary.md`](./KPI_Dictionary.md)
2. [`Data_Dictionary.md`](./Data_Dictionary.md)
3. [`Assumptions_and_Limitations.md`](./Assumptions_and_Limitations.md)

## Related Repository Folders

| Folder | Purpose |
|---|---|
| `02_sql/` | SQL scripts, validation checks, analytical views, and business insight queries |
| `03_powerbi/` | Power BI dashboard file and dashboard screenshots |
| `05_diagrams/` | Draw.io stakeholder map and inventory risk review decision flow |
| `06_jira_artifacts/` | Jira screenshots showing epics, stories, priorities, statuses, acceptance criteria, and selected subtasks |
