# Maven Toys Sales & Inventory Operations Optimization

## Overview

This project analyzes Maven Toys sales, profitability, store performance, and inventory risk using **SQL Server**, **Power BI**, and **Business Analysis documentation**.

The goal is not only to build a dashboard, but to turn the dataset into a complete business case: from requirements and KPIs to user stories, diagrams, Jira evidence, and business recommendations.

This project answers questions such as:

* Which products and categories generate the most profit?
* Are high-revenue products always the best performers?
* Which store locations perform best by total contribution and by per-store efficiency?
* Which inventory items are at risk of stockout?
* How should stakeholders use the dashboard for weekly business review?

---

## Tools Used

| Tool       | Purpose                                                                             |
| ---------- | ----------------------------------------------------------------------------------- |
| SQL Server | Data validation, KPI logic, SQL views, and business insight queries                 |
| Power BI   | Dashboard design, KPI cards, visual storytelling, and stakeholder reporting         |
| DAX        | Power BI measures and calculated metrics                                            |
| Jira       | Agile backlog with epics, user stories, priorities, statuses, and selected subtasks |
| Confluence | BA documentation workspace                                                          |
| Draw.io    | Stakeholder map and inventory risk review decision flow                             |
| GitHub     | Portfolio packaging and project documentation                                       |

---

## Dataset

The dataset contains four main CSV files:

| File            | Description                                        |
| --------------- | -------------------------------------------------- |
| `sales.csv`     | Sales transaction records                          |
| `products.csv`  | Product master data with category, price, and cost |
| `stores.csv`    | Store master data with city and location type      |
| `inventory.csv` | Current stock-on-hand by product-store combination |

Data files are stored in:

```text
01_data/raw/
```

Original dataset documentation is stored in:

```text
01_data/original_data_dictionary/
```

---

## Power BI Dashboard

The Power BI report has four pages:

| Page                           | Purpose                                                                                             |
| ------------------------------ | --------------------------------------------------------------------------------------------------- |
| Executive Summary              | High-level view of revenue, profit, margin, units sold, inventory value, and urgent inventory items |
| Product Profitability Analysis | Product and category performance by revenue, profit, margin, units sold, and profit per unit        |
| Store & Location Performance   | Store/location comparison by total contribution and per-store efficiency                            |
| Inventory Risk & Replenishment | Inventory value, stock on hand, stockout risk, and urgent review prioritization                     |

Dashboard files are stored in:

```text
03_power_bi/
```

Dashboard screenshots are stored in:

```text
03_power_bi/screenshots/
```

---

## Key KPIs

| KPI                    |    Value |
| ---------------------- | -------: |
| Total Revenue          |  $14.44M |
| Total Cost             |  $10.43M |
| Total Profit           |   $4.01M |
| Profit Margin          |   27.79% |
| Units Sold             |    1.09M |
| Transactions           |     829K |
| Inventory Value        | $300.21K |
| Urgent Inventory Items |      436 |
| Stockout Risk Rate     |   27.37% |

---

## Key Insights

### 1. Revenue alone can be misleading

Some products generate strong revenue but weaker margins.

For example:

* **Lego Bricks** has high revenue but a lower margin of about **12.50%**
* **Colorbuds** is the strongest product by profit and margin, with around **$834,944 profit** and **53.37% margin**

This means product decisions should consider:

```text
Revenue + Profit + Margin + Profit per Unit
```

not revenue alone.

---

### 2. Store performance should separate scale from efficiency

**Downtown** contributes the most total revenue and profit, partly because it has the largest number of stores.

However, **Airport** stores perform strongest on a per-store basis:

| Metric                   |     Airport |
| ------------------------ | ----------: |
| Average Profit per Store | $126,016.33 |
| Profit Margin            |      29.31% |

This shows that Downtown is the strongest scale contributor, while Airport is the better efficiency benchmark.

---

### 3. Inventory risk needs structured review

The dashboard identifies **436 urgent inventory items**:

| Risk Type          | Count |
| ------------------ | ----: |
| High Stockout Risk |   359 |
| Out of Stock       |    77 |

The overall **Stockout Risk Rate is 27.37%**, meaning more than one-quarter of product-store inventory records require attention.

---

### 4. Toys is both an opportunity and a risk area

The **Toys** category is the highest-profit category and also carries the highest inventory value at around **$99.86K**.

This means Toys should be monitored closely because it is both:

* a major profit driver
* a category with meaningful inventory exposure

---

## Business Recommendations

| Recommendation                                                                        | Finding                                                                                                              | Stakeholder                                         | Priority |
| ------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------- | -------- |
| Establish a weekly urgent inventory review process                                    | 436 urgent inventory items, including 359 High Stockout Risk and 77 Out of Stock items                               | Inventory Planner / Store Operations Manager        | Highest  |
| Treat inventory-risk outputs as review priorities, not automatic replenishment orders | Dataset lacks lead time, reorder quantity, safety stock, lost sales, promotion calendar, and daily inventory history | Inventory Planner / BI Analyst                      | Highest  |
| Use Airport stores as an efficiency benchmark                                         | Airport has the highest average profit per store and strongest margin                                                | Store Operations Manager                            | High     |
| Separate total contribution from per-store efficiency                                 | Downtown leads by total contribution partly because it has 29 stores                                                 | Executive Manager / Store Operations Manager        | High     |
| Review high-revenue but lower-margin products separately                              | Lego Bricks has high revenue but weaker margin compared with Colorbuds                                               | Product / Merchandising Manager                     | High     |
| Monitor Toys as both a profit driver and inventory exposure area                      | Toys has the highest profit contribution and highest inventory value                                                 | Product / Merchandising Manager / Inventory Planner | High     |

---

## Business Analysis Documentation

BA documentation is stored in:

```text
04_ba_docs/
```

| File                                      | Purpose                                                                                      |
| ----------------------------------------- | -------------------------------------------------------------------------------------------- |
| `BRD.md`                                  | Business problem, objectives, scope, stakeholders, requirements, tools, and success criteria |
| `KPI_Dictionary.md`                       | KPI definitions, formulas, sources, dashboard placement, and interpretation                  |
| `Data_Dictionary.md`                      | Source tables, SQL views, fields, and data interpretation notes                              |
| `Use_Cases.md`                            | Stakeholder use cases with actors, flows, alternatives, exceptions, assumptions, and notes   |
| `User_Stories_and_Acceptance_Criteria.md` | Jira epics, user stories, acceptance criteria, priorities, and selected subtasks             |
| `Requirement_Traceability_Matrix.md`      | Lightweight traceability from requirements to Jira, SQL, Power BI, and evidence              |
| `Assumptions_and_Limitations.md`          | Data assumptions, limitations, and interpretation boundaries                                 |
| `Business_Recommendations.md`             | Data-driven business recommendations                                                         |
| `Maven_Toys_BA_Documentation_Pack.pdf`    | Full polished BA documentation pack                                                          |

The documentation helps show that the dashboard is requirement-driven, not just a collection of visuals.

---

## Agile / Jira Evidence

Jira was used to organize the work as:

```text
Epic → Story → selected Subtasks
```

The project uses a Kanban workflow because it was completed individually. The user stories and acceptance criteria are written in a Scrum-compatible style, so they can support backlog refinement, sprint planning, stakeholder review, and acceptance testing in a team setting.

Jira evidence is stored in:

```text
06_jira_artifacts/
```

| File                                                | Purpose                                                   |
| --------------------------------------------------- | --------------------------------------------------------- |
| `jira_board_status_overview.png`                    | Shows Kanban workflow status distribution                 |
| `jira_list_epics_stories_priorities.png`            | Shows epics, stories, priorities, statuses, and assignees |
| `jira_epic_child_stories_inventory_risk.png`        | Shows an epic with child stories                          |
| `jira_story_acceptance_criteria_inventory_risk.png` | Shows a story with acceptance criteria                    |
| `jira_story_subtasks_example.png`                   | Shows selected subtasks for a complex story               |

---

## Diagrams

Draw.io diagrams are stored in:

```text
05_diagrams/
```

| Diagram                                   | Purpose                                                                                               |
| ----------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| `stakeholder_map.png`                     | Shows core dashboard users, supporting operational stakeholders, and external/governance stakeholders |
| `inventory_risk_review_decision_flow.png` | Shows how inventory-risk categories translate into review actions                                     |

Editable `.drawio` files are also included.

---

## Repository Structure

```text
MexicoToySales/
│
├── 01_data/
│   ├── raw/
│   │   ├── inventory.csv
│   │   ├── products.csv
│   │   ├── sales.csv
│   │   └── stores.csv
│   └── original_data_dictionary/
│
├── 02_sql/
│   ├── 01_data_quality_checks.sql
│   ├── 02_sales_profit_view.sql
│   ├── 03_kpi_analysis.sql
│   ├── 04_inventory_risk_view.sql
│   └── 05_inventory_analysis.sql
│
├── 03_power_bi/
│   ├── Maven_Toys_Sales_Inventory_Operations_Dashboard.pbix
│   └── screenshots/
│
├── 04_ba_docs/
│   ├── README.md
│   ├── Maven_Toys_BA_Documentation_Pack.pdf
│   ├── BRD.md
│   ├── KPI_Dictionary.md
│   ├── Data_Dictionary.md
│   ├── Use_Cases.md
│   ├── User_Stories_and_Acceptance_Criteria.md
│   ├── Requirement_Traceability_Matrix.md
│   ├── Assumptions_and_Limitations.md
│   └── Business_Recommendations.md
│
├── 05_diagrams/
│   ├── stakeholder_map.drawio
│   ├── stakeholder_map.png
│   ├── inventory_risk_review_decision_flow.drawio
│   └── inventory_risk_review_decision_flow.png
│
├── 06_jira_artifacts/
│   ├── jira_board_status_overview.png
│   ├── jira_list_epics_stories_priorities.png
│   ├── jira_epic_child_stories_inventory_risk.png
│   ├── jira_story_acceptance_criteria_inventory_risk.png
│   └── jira_story_subtasks_example.png
│
└── README.md
```

---

## Limitations

This project is a decision-support analytics project, not a fully automated replenishment system.

Key limitations:

* No supplier lead time
* No reorder quantity
* No reorder point
* No safety stock
* No lost sales data
* No promotion calendar
* No daily historical inventory snapshots
* Inventory data is treated as a current stock snapshot

Because of these limitations, inventory-risk outputs should be used as review priorities, not automatic replenishment instructions.

---

## What This Project Demonstrates

This project demonstrates skills relevant to Business Analyst, Operations Analyst, and Data Analyst internship roles:

* SQL data validation and analytical view creation
* Power BI dashboard design and KPI storytelling
* Retail sales, profitability, store, and inventory analysis
* Business requirements documentation
* KPI and data dictionary creation
* Use cases and user stories with acceptance criteria
* Lightweight Agile traceability
* Jira backlog and delivery evidence
* Draw.io stakeholder and process diagrams
* Data-driven business recommendations

---

## Final Summary

The Maven Toys Sales & Inventory Operations Optimization project shows how SQL, Power BI, and BA documentation can work together to create a complete business decision-support solution.

The dashboard helps stakeholders monitor business performance, evaluate product profitability, compare store performance fairly, and prioritize inventory-risk review. The BA documentation strengthens the project by showing how each dashboard output connects to business requirements, stakeholder needs, Jira stories, SQL logic, assumptions, and recommendations.
