# Requirement Traceability Matrix (RTM)
## Maven Toys Sales & Inventory Operations Optimization

This matrix connects each business objective to its functional requirement, Jira epic, Jira user story, SQL data object, Power BI dashboard page, and evidence artifact. It ensures the dashboard remains requirement-driven and that every output can be traced back to a documented stakeholder need.

---

## How to Read This Matrix

| Column | Meaning |
|---|---|
| **Req. ID** | Functional requirement identifier from the BRD |
| **Business Objective** | The high-level stakeholder goal this requirement supports |
| **Requirement** | The specific functional requirement statement |
| **Epic** | Jira epic grouping the delivery work |
| **Story** | Jira user story implementing the requirement |
| **SQL Object** | View or table providing the underlying data |
| **Power BI Page** | Dashboard page where the output is visible |
| **Evidence** | Artifacts confirming delivery and traceability |

---

## Traceability Matrix

| Req. ID | Business Objective | Requirement | Epic | Story | SQL Object | Power BI Page | Evidence |
|---|---|---|---|---|---|---|---|
| **FR-01** | Monitor executive business performance | Show total revenue, total profit, profit margin, units sold, inventory value, and urgent inventory items. | Executive Performance Overview | KAN-6: View executive KPI summary | `vw_sales_profit`; `vw_inventory_risk` | Executive Summary | KPI cards; Jira story KAN-6; KPI Dictionary |
| **FR-02** | Track sales and profit trend over time | Show monthly revenue and profit trend with correct Month-Year sorting. | Executive Performance Overview | KAN-7: Monitor monthly revenue and profit trend | `vw_sales_profit`; `DimDate` | Executive Summary | Monthly trend visual; Month-Year sorting evidence |
| **FR-03** | Support product/category profitability decisions | Compare product categories by revenue, profit, margin, units sold, and profit per unit. | Product Profitability Analysis | KAN-8: Compare product category profitability | `vw_sales_profit`; `products` | Product Profitability Analysis | Profitability matrix; category comparison visuals |
| **FR-04** | Identify product action opportunities | Identify high-revenue/high-margin, high-revenue/lower-margin, and lower-performing products. | Product Profitability Analysis | KAN-9: Identify product action groups | `vw_sales_profit`; `products` | Product Profitability Analysis | Revenue vs. margin scatter; top product visual |
| **FR-05** | Compare store/location performance | Compare store locations by total contribution and average performance per store. | Store & Location Performance Analysis | KAN-10: Compare store locations by total contribution; KAN-11: Compare store locations by per-store efficiency | `vw_sales_profit`; `stores` | Store & Location Performance | Store hierarchy matrix; average revenue/profit per store visuals |
| **FR-06** | Classify inventory risk | Classify inventory into Out of Stock, High Stockout Risk, Medium Stockout Risk, Healthy Stock, and No Sales History. | Inventory Risk Review | KAN-12: Classify inventory risk | `vw_inventory_risk` | Inventory Risk & Replenishment | Risk distribution visual; risk classification logic documentation |
| **FR-07** | Prioritize urgent inventory review | Highlight out-of-stock and high-stockout-risk product-store combinations. | Inventory Risk Review | KAN-13: Prioritize urgent inventory review items | `vw_inventory_risk` | Inventory Risk & Replenishment | Urgent Inventory Items KPI card; inventory risk by category/location |
| **FR-08** | Support responsible interpretation | Document assumptions, limitations, and data-quality boundaries. | Data Quality & KPI Governance | KAN-15: Validate sales-profit view; KAN-16: Document assumptions and limitations | `vw_sales_profit`; `vw_inventory_risk`; SQL validation scripts | All pages | Assumptions & Limitations page; SQL validation evidence |

---

## Coverage Summary

| Coverage Area | Total Items | Fully Traced | Notes |
|---|---|---|---|
| Functional Requirements | 8 | 8 | All FR-01 to FR-08 are traced to epics, stories, SQL, and Power BI |
| Jira Epics | 5 | 5 | KAN-1 through KAN-5 all mapped to requirements |
| Jira Stories | 11 | 11 | KAN-6 through KAN-16 all mapped to requirements |
| SQL Objects | 2 views | 2 | `vw_sales_profit` and `vw_inventory_risk` cover all requirements |
| Power BI Pages | 4 | 4 | Executive Summary, Product Profitability, Store & Location, Inventory Risk |

---

## Requirement-to-Dashboard Page Mapping

| Power BI Page | Requirements Addressed | Primary Stakeholder |
|---|---|---|
| Executive Summary | FR-01, FR-02, FR-07 | Executive Manager |
| Product Profitability Analysis | FR-03, FR-04 | Product / Merchandising Manager |
| Store & Location Performance | FR-05 | Store Operations Manager |
| Inventory Risk & Replenishment | FR-06, FR-07, FR-08 | Inventory Planner, Procurement / Buying Team |

---

## Jira Story Status at Project Close

| Story ID | Story Name | Epic | Priority | Status |
|---|---|---|---|---|
| KAN-6 | View executive KPI summary | Executive Performance Overview | Highest | Done |
| KAN-7 | Monitor monthly revenue and profit trend | Executive Performance Overview | Medium | To Do |
| KAN-8 | Compare product category profitability | Product Profitability Analysis | High | Done |
| KAN-9 | Identify product action groups | Product Profitability Analysis | High | In Progress |
| KAN-10 | Compare store locations by total contribution | Store & Location Performance Analysis | Medium | In Progress |
| KAN-11 | Compare store locations by per-store efficiency | Store & Location Performance Analysis | High | Done |
| KAN-12 | Classify inventory risk | Inventory Risk Review | Highest | Done |
| KAN-13 | Prioritize urgent inventory review items | Inventory Risk Review | Highest | In Review |
| KAN-14 | Review no-sales-history inventory items | Inventory Risk Review | Medium | In Review |
| KAN-15 | Validate sales-profit view | Data Quality & KPI Governance | Highest | Done |
| KAN-16 | Document assumptions and limitations | Data Quality & KPI Governance | High | Done |

---

> **Note:** This matrix should be reviewed whenever a new requirement is added, a story scope changes, or a dashboard page is modified. Maintaining traceability ensures the solution remains aligned with documented stakeholder needs rather than evolving into a visual-only report.
