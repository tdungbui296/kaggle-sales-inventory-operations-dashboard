# Business Requirements Document (BRD)
## Maven Toys Sales & Inventory Operations Optimization

| Field | Details |
|---|---|
| **Project Name** | Maven Toys Sales & Inventory Operations Optimization |
| **Document Version** | 1.0 |
| **Contributor** | Bui Tuan Dung |
| **Status** | Final |

---

## 1. Background

Maven Toys needs a structured business intelligence solution to monitor sales performance, product profitability, store/location performance, and inventory risk. The dashboard is designed to support management review and operational prioritization rather than replace a full inventory optimization system.

---

## 2. Business Problem

Retail stakeholders may over-rely on revenue rankings when evaluating business performance. This can:

- Hide lower-margin products behind high-revenue figures
- Distort store performance comparisons when store count differs by location
- Cause stockout-risk exposure to go undetected at the product-store level

A requirement-driven dashboard is needed to connect KPIs, business questions, and operational actions into a single decision-support view.

### Business Pain Points

| Pain Point | Business Impact |
|---|---|
| Revenue alone can be misleading | High-revenue products may have weaker margins and lower profit efficiency |
| Store count can distort location performance | Locations with more stores may appear stronger by total revenue even if per-store efficiency is lower |
| Inventory risk is difficult to prioritize manually | Out-of-stock and high-risk product-store combinations may be missed |
| KPI definitions may be inconsistent | Stakeholders may interpret revenue, profit, margin, inventory value, and risk differently |
| Inventory data appears to be a current stock snapshot | Inventory-risk results require careful interpretation and documented assumptions |

---

## 3. Project Objectives

- Provide an executive overview of revenue, profit, margin, units sold, transactions, inventory value, and urgent inventory items.
- Identify product and category profitability patterns using revenue, profit, margin, units sold, and profit per unit.
- Compare store and location performance using both total contribution and average performance per store.
- Classify inventory risk and prioritize out-of-stock and high-stockout-risk product-store combinations.
- Document KPI definitions, assumptions, limitations, and business recommendations for stakeholder interpretation.

---

## 4. Scope

### In Scope

| Area | Description |
|---|---|
| Sales and profitability analysis | Revenue, cost, profit, profit margin, units sold, and transaction analysis |
| Product analysis | Category and product-level profitability, margin, and action matrix |
| Store analysis | Store and location performance by total and average metrics |
| Inventory-risk analysis | Inventory value, stock on hand, risk category, urgent items, and stockout risk rate |
| BA documentation | BRD, KPI dictionary, data dictionary, use cases, Jira user stories, assumptions, recommendations, and traceability |

### Out of Scope

| Area | Reason |
|---|---|
| Full replenishment optimization | Supplier lead time, reorder quantity, reorder point, and safety stock are not available |
| Demand forecasting | The current version focuses on descriptive and diagnostic decision support |
| Customer segmentation | The dataset does not contain customer-level basket or demographic data |
| Promotion effectiveness analysis | Promotion calendar and campaign fields are not available |

---

## 5. Stakeholders

| Stakeholder | Role | Business Need |
|---|---|---|
| Executive Manager | Primary business sponsor | High-level visibility into revenue, profit, margin, sales volume, and operational risk |
| Product / Merchandising Manager | Product and assortment decision stakeholder | Product/category profitability, margin performance, and product prioritization insights |
| Store Operations Manager | Store and location performance stakeholder | Store efficiency, location benchmarking, and performance comparison |
| Inventory Planner | Inventory-risk and replenishment-review stakeholder | Stockout-risk prioritization and inventory review categories |
| Store Managers | Local execution stakeholder | Store-level insights to support local stock, product, and operational actions |
| Procurement / Buying Team | Supplier-order and buying stakeholder | Replenishment planning, supplier coordination, and product availability review |
| BI / Data Analyst | Technical delivery and governance owner | Maintains SQL logic, KPI definitions, data model reliability, and dashboard accuracy |
| Customers / Parents | External impacted stakeholder | Product availability, value, relevant assortment, and safe products |
| Toy Suppliers / Manufacturers | External supply stakeholder | Product supply, cost inputs, and replenishment support |
| Product Safety / Compliance | Governance stakeholder | Toy safety, labeling, and regulatory considerations |

---

## 6. Functional Requirements

| ID | Requirement | Dashboard Area |
|---|---|---|
| FR-01 | The dashboard must show total revenue, total cost, total profit, profit margin, units sold, and transactions. | Executive Summary |
| FR-02 | The dashboard must show monthly revenue and profit trends. | Executive Summary |
| FR-03 | The dashboard must compare product categories and products by revenue, profit, margin, units sold, and profit per unit. | Product Profitability Analysis |
| FR-04 | The dashboard must help users identify high-revenue but weaker-margin products. | Product Profitability Analysis |
| FR-05 | The dashboard must compare store locations by total contribution and average performance per store. | Store & Location Performance |
| FR-06 | The dashboard must classify inventory by risk category. | Inventory Risk & Replenishment |
| FR-07 | The dashboard must highlight urgent inventory items, including out-of-stock and high-stockout-risk items. | Inventory Risk & Replenishment |
| FR-08 | The dashboard must allow filtering by year, store location, product category, and store city. | All Pages |

---

## 7. Non-Functional Requirements

| ID | Requirement |
|---|---|
| NFR-01 | KPI values must be validated against SQL query outputs. |
| NFR-02 | Dashboard pages must use consistent page navigation, naming, and formatting. |
| NFR-03 | KPI definitions must be documented in the KPI Dictionary. |
| NFR-04 | Inventory-risk assumptions must be clearly documented because inventory data is treated as a current stock snapshot. |
| NFR-05 | Dashboard visuals should support business decision-making, not only descriptive reporting. |

---

## 8. Tools Used

| Tool | Purpose |
|---|---|
| SQL Server | Data validation, SQL views, KPI logic, and business analysis queries |
| Power BI | Interactive dashboard design and visual storytelling |
| Confluence | Business requirements, KPI dictionary, use cases, assumptions, limitations, and recommendations |
| Jira | Epics, user stories, acceptance criteria, and Agile delivery tracking |
| Draw.io | Stakeholder map and inventory risk review decision flow |
| GitHub | Public portfolio packaging and project repository |

---

## 9. Success Criteria

- Executive KPIs are visible and match SQL-validated values.
- Product, store, and inventory pages answer the defined business questions.
- Inventory-risk categories are clearly interpreted as action priorities.
- Stakeholders can trace dashboard pages back to requirements and Jira user stories.
- Assumptions and limitations are documented clearly enough to prevent overclaiming.

---

## 10. Assumptions & Limitations

### Assumptions

| Assumption | Interpretation |
|---|---|
| Inventory data is treated as a current stock snapshot | Inventory-risk results reflect current stock availability rather than historical stock movement |
| Sales history is used as demand evidence | Historical units sold are used to estimate sales velocity and days of inventory left |
| Product price and product cost are treated as valid for KPI calculation | Revenue, cost, profit, and margin are calculated from the available product master fields |
| Inventory risk is directional | Risk categories help prioritize review but do not replace a full replenishment planning system |

### Limitations

| Limitation | Business Impact |
|---|---|
| No supplier lead time | Cannot calculate precise reorder timing |
| No reorder point | Cannot define formal stock trigger thresholds |
| No reorder quantity | Cannot recommend exact replenishment quantity |
| No safety stock | Cannot account for demand uncertainty or buffer stock |
| No daily historical inventory snapshots | Cannot analyze stock movement over time |
| No lost sales data | Cannot quantify revenue lost due to stockouts |
| No promotion calendar | Cannot separate normal demand from promotion-driven demand |
| No product launch dates | Newer products may have shorter sales histories and require careful interpretation |
| Some sales product-store combinations are missing current inventory records | Sales-profit analysis can retain these rows, but inventory-risk analysis should be interpreted cautiously |

> **Interpretation Boundary:** The inventory-risk model should be treated as a decision-support layer. It helps stakeholders identify likely stockout exposure and review priorities, but final replenishment decisions should incorporate supplier lead time, reorder rules, safety stock, promotion plans, and operational constraints.
