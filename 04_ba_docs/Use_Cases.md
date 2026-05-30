# Use Cases
## Maven Toys Sales & Inventory Operations Optimization

This document specifies the five main business use cases supported by the Power BI dashboard, following the standard 13-field template (Karl Wiegers / IIBA style).

---

## UC List

| UC ID | Use Case Name | Primary Actor | Business Goal | Priority |
|---|---|---|---|---|
| UC-01 | Monitor Executive Business Performance | Executive Manager | Understand overall revenue, profit, margin, sales volume, and inventory risk at a glance | High |
| UC-02 | Analyze Product and Category Profitability | Product / Merchandising Manager | Identify products and categories that drive profit and margin | High |
| UC-03 | Compare Store and Location Performance | Store Operations Manager | Separate total contribution from per-store efficiency across locations | High |
| UC-04 | Identify Inventory Stockout Risk | Inventory Planner | Find product-store combinations that require urgent replenishment attention | Highest |
| UC-05 | Prioritize Weekly Replenishment Review | Inventory Planner | Convert inventory risk signals into an operational weekly review list | Highest |

---

## UC-01: Monitor Executive Business Performance

| **Use Case ID:** | UC-01 |
|---|---|
| **Use Case Name:** | Monitor Executive Business Performance |
| **Created By:** | Bui Tuan Dung | **Last Updated By:** | Bui Tuan Dung |
| **Date Created:** | May 2026 | **Date Last Updated:** | May 2026 |

| **Actor:** | **Primary:** Executive Manager / **Secondary:** BI / Data Analyst |
|---|---|
| **Description:** | The Executive Manager needs a single consolidated view of business health, covering revenue, profit, margin, sales volume, and operational risk exposure. This use case allows the manager to assess current performance and identify areas requiring further investigation. |
| **Preconditions:** | 1. Sales-profit and inventory-risk data have been refreshed in the dashboard. 2. Dashboard filters (year, location, category, city) are available and functioning. |
| **Postconditions:** | 1. Executive Manager identifies the current overall business performance position. 2. High-risk inventory areas are flagged for follow-up by relevant stakeholders. |
| **Priority:** | High |
| **Frequency of Use:** | Weekly management review; ad hoc as needed |

| **Normal Course of Events:** | |
|---|---|
| | 1. Executive Manager opens the Executive Summary page of the dashboard. |
| | 2. System displays KPI cards for Total Revenue, Total Cost, Total Profit, Profit Margin, Units Sold, Inventory Value, and Urgent Inventory Items. |
| | 3. Executive Manager reviews the monthly revenue and profit trend chart. |
| | 4. System shows trend line with correct Month-Year sorting across the selected period. |
| | 5. Executive Manager reviews the inventory risk distribution visual. |
| | 6. System highlights the proportion of Out of Stock and High Stockout Risk records. |
| | 7. Executive Manager identifies any KPIs or risk areas requiring deeper investigation. |

| **Alternative Courses:** | |
|---|---|
| UC-01.AC.1: KPI value appears inconsistent | At step 2, if a KPI card value does not appear consistent with expectations, the Executive Manager refers to the KPI Dictionary and SQL validation notes before escalating. |
| UC-01.AC.2: Filter applied for a specific period | At step 1, Executive Manager applies a year or location filter. System refreshes all KPI cards and visuals to reflect the filtered scope. |

| **Exceptions:** | |
|---|---|
| UC-01.EX.1: Dashboard data is stale | If the data refresh has not been completed, the system displays the last refresh timestamp. Executive Manager defers review until data is current. |

| **Includes:** | N/A |
| **Special Requirements:** | KPI values must be validated against SQL outputs (NFR-01). Dashboard must load within an acceptable time for weekly review cadence. |
| **Assumptions:** | Inventory data represents a current stock snapshot, not historical movement. |
| **Notes and Issues:** | [TBD-01] Define formal data refresh schedule for production deployment. |

---

## UC-02: Analyze Product and Category Profitability

| **Use Case ID:** | UC-02 |
|---|---|
| **Use Case Name:** | Analyze Product and Category Profitability |
| **Created By:** | Bui Tuan Dung | **Last Updated By:** | Bui Tuan Dung |
| **Date Created:** | May 2026 | **Date Last Updated:** | May 2026 |

| **Actor:** | **Primary:** Product / Merchandising Manager / **Secondary:** BI / Data Analyst |
|---|---|
| **Description:** | The Product Manager needs to evaluate product and category performance across multiple dimensions — revenue, profit, margin, units sold, and profit per unit — in order to classify products into strategic action groups and make prioritization decisions. |
| **Preconditions:** | 1. Product and sales-profit data are available and refreshed in the dashboard. 2. KPI definitions are documented and accessible. |
| **Postconditions:** | 1. Product stakeholders identify which products and categories are strategic profit drivers. 2. High-revenue but lower-margin products are flagged for pricing or cost review. |
| **Priority:** | High |
| **Frequency of Use:** | Monthly product review; ad hoc for assortment decisions |

| **Normal Course of Events:** | |
|---|---|
| | 1. Product Manager opens the Product Profitability Analysis page. |
| | 2. System displays the product/category profitability matrix showing Revenue, Profit, Margin, Units Sold, and Profit per Unit. |
| | 3. Product Manager reviews category-level rankings and compares profitability across categories. |
| | 4. Product Manager drills down to individual product level. |
| | 5. System displays product-level revenue vs. margin positioning on a scatter chart and top products by profit. |
| | 6. Product Manager identifies strategic winners (high revenue, high margin), margin-review products (high revenue, lower margin), and lower-performing products. |
| | 7. Product Manager records product action groups for review with the merchandising team. |

| **Alternative Courses:** | |
|---|---|
| UC-02.AC.1: High-revenue product with low margin identified | At step 6, if a product has high revenue but a low margin, Product Manager flags it for pricing, cost-structure, or promotion review before taking action. |
| UC-02.AC.2: Category filter applied | At step 3, Product Manager applies a category filter. System refreshes all product visuals to reflect the selected category scope. |

| **Exceptions:** | |
|---|---|
| UC-02.EX.1: Product data missing | If a product appears in sales data but not in the product master, revenue is included but margin may be incorrect. BI Analyst is notified to investigate data quality. |

| **Includes:** | N/A |
| **Special Requirements:** | Revenue vs. margin scatter must support product-level tooltips to avoid misidentification. |
| **Assumptions:** | Product_Price and Product_Cost are treated as stable values for margin calculation. |
| **Notes and Issues:** | [TBD-02] Confirm whether profit per unit should be weighted by volume or unweighted for ranking purposes. |

---

## UC-03: Compare Store and Location Performance

| **Use Case ID:** | UC-03 |
|---|---|
| **Use Case Name:** | Compare Store and Location Performance |
| **Created By:** | Bui Tuan Dung | **Last Updated By:** | Bui Tuan Dung |
| **Date Created:** | May 2026 | **Date Last Updated:** | May 2026 |

| **Actor:** | **Primary:** Store Operations Manager / **Secondary:** Store Managers, BI / Data Analyst |
|---|---|
| **Description:** | The Store Operations Manager needs to compare store locations using both total contribution and per-store efficiency metrics, in order to correctly benchmark locations and avoid distortion caused by differences in store count across locations. |
| **Preconditions:** | 1. Store and sales-profit data are available and refreshed. 2. Store count by location is correctly captured and visible in the dashboard. |
| **Postconditions:** | 1. Operations stakeholders identify which locations are strong total contributors and which are strong per-store performers. 2. Scale effect is separated from efficiency in the performance comparison. |
| **Priority:** | High |
| **Frequency of Use:** | Monthly store performance review |

| **Normal Course of Events:** | |
|---|---|
| | 1. Store Operations Manager opens the Store & Location Performance page. |
| | 2. System displays total revenue and total profit by store location in a hierarchy matrix. |
| | 3. Store Operations Manager reviews store count context for each location. |
| | 4. System displays Average Revenue per Store and Average Profit per Store by location. |
| | 5. Store Operations Manager compares total contribution rankings against per-store efficiency rankings. |
| | 6. Store Operations Manager identifies locations that lead in total performance due to store count versus those with genuine per-store efficiency. |
| | 7. Store Operations Manager records efficiency benchmarks and scale contributors for operational planning. |

| **Alternative Courses:** | |
|---|---|
| UC-03.AC.1: Location leads in total but not in average | At step 6, if Downtown leads in total profit but not in average profit per store, Store Operations Manager interprets this as a scale effect and uses Airport as the efficiency benchmark. |
| UC-03.AC.2: Location filter applied | At step 1, Store Operations Manager filters to a specific city or location type. System refreshes all store visuals accordingly. |

| **Exceptions:** | |
|---|---|
| UC-03.EX.1: Store count mismatch | If the store count shown in the dashboard does not match operational records, BI Analyst is notified to validate the stores table. |

| **Includes:** | N/A |
| **Special Requirements:** | Store count must be visible alongside total and average metrics to prevent misinterpretation. |
| **Assumptions:** | All active stores are represented in the stores table and correctly assigned to a Store_Location type. |
| **Notes and Issues:** | N/A |

---

## UC-04: Identify Inventory Stockout Risk

| **Use Case ID:** | UC-04 |
|---|---|
| **Use Case Name:** | Identify Inventory Stockout Risk |
| **Created By:** | Bui Tuan Dung | **Last Updated By:** | Bui Tuan Dung |
| **Date Created:** | May 2026 | **Date Last Updated:** | May 2026 |

| **Actor:** | **Primary:** Inventory Planner / **Secondary:** Procurement / Buying Team |
|---|---|
| **Description:** | The Inventory Planner needs to identify product-store combinations currently at risk of stockout, using risk classification based on stock on hand, historical sales velocity, and days of inventory left, in order to prioritize replenishment review actions. |
| **Preconditions:** | 1. Inventory-risk view has been refreshed and risk classifications are available. 2. Dashboard filters (product category, store location, store city) are functional. |
| **Postconditions:** | 1. Urgent product-store inventory items (Out of Stock and High Stockout Risk) are identified. 2. Inventory Planner has a prioritized review list for operational follow-up. |
| **Priority:** | Highest |
| **Frequency of Use:** | Weekly; more frequently during high-demand periods |

| **Normal Course of Events:** | |
|---|---|
| | 1. Inventory Planner opens the Inventory Risk & Replenishment page. |
| | 2. System displays KPI cards: Inventory Value, Stock On Hand, High Stockout Risk Items, Out of Stock Items, Urgent Inventory Items, and Stockout Risk Rate. |
| | 3. Inventory Planner reviews the risk category distribution across product categories and store locations. |
| | 4. Inventory Planner applies filters for product category, store location, or store city to narrow focus. |
| | 5. System refreshes all visuals to reflect the filtered scope. |
| | 6. Inventory Planner identifies specific product-store combinations flagged as Out of Stock or High Stockout Risk. |
| | 7. Inventory Planner records urgent items for replenishment review. |

| **Alternative Courses:** | |
|---|---|
| UC-04.AC.1: Item has no sales history | At step 6, if an item is classified as No Sales History, Inventory Planner does not treat it as an automatic stockout risk. The item is reviewed separately to determine whether it is newly stocked, slow-moving, or affected by data issues. |

| **Exceptions:** | |
|---|---|
| UC-04.EX.1: Inventory record missing for a product-store | If a product-store combination appears in sales data but has no inventory record, the record is excluded from risk classification. Inventory Planner flags this for BI Analyst investigation. |

| **Includes:** | UC-05: Prioritize Weekly Replenishment Review |
| **Special Requirements:** | Risk classification logic and thresholds must be documented in the KPI Dictionary and Assumptions & Limitations page. |
| **Assumptions:** | Inventory data is a current stock snapshot. Days of inventory left is directional and does not account for incoming shipments or safety stock. |
| **Notes and Issues:** | [TBD-03] Confirm risk threshold values (e.g., days of inventory left cutoffs for High vs. Medium Stockout Risk) with the Inventory Planning team. |

---

## UC-05: Prioritize Weekly Replenishment Review

| **Use Case ID:** | UC-05 |
|---|---|
| **Use Case Name:** | Prioritize Weekly Replenishment Review |
| **Created By:** | Bui Tuan Dung | **Last Updated By:** | Bui Tuan Dung |
| **Date Created:** | May 2026 | **Date Last Updated:** | May 2026 |

| **Actor:** | **Primary:** Inventory Planner / **Secondary:** Procurement / Buying Team, Store Operations Manager |
|---|---|
| **Description:** | Following the identification of stockout risk, the Inventory Planner converts the risk signals into an operational weekly review list, categorized by urgency, in order to support replenishment planning discussions with the procurement and buying team. |
| **Preconditions:** | 1. UC-04 has been completed and urgent inventory items are identified. 2. Risk categories and urgent item measures are available in the dashboard. |
| **Postconditions:** | 1. A prioritized weekly urgent inventory review list is prepared. 2. Medium-risk items are added to a watchlist for ongoing monitoring. |
| **Priority:** | Highest |
| **Frequency of Use:** | Weekly |

| **Normal Course of Events:** | |
|---|---|
| | 1. Inventory Planner filters the Inventory Risk & Replenishment page to show only Out of Stock and High Stockout Risk records. |
| | 2. System displays the filtered list of urgent product-store combinations with their risk classification and stock details. |
| | 3. Inventory Planner reviews the category and location distribution of urgent items. |
| | 4. Inventory Planner exports or records the priority item list. |
| | 5. Inventory Planner prepares an agenda for the weekly replenishment review discussion with the Procurement / Buying Team. |
| | 6. Procurement / Buying Team reviews the list and initiates supplier-order coordination for confirmed replenishment items. |

| **Alternative Courses:** | |
|---|---|
| UC-05.AC.1: Medium-risk items present | At step 3, if Medium Stockout Risk items are identified for a high-priority category, Inventory Planner adds them to a watchlist rather than the immediate review list. |
| UC-05.AC.2: Replenishment action is not straightforward | At step 6, if an Out of Stock item requires validation (e.g., the product may be discontinued or transferred), Procurement marks it for investigation before placing an order. |

| **Exceptions:** | |
|---|---|
| UC-05.EX.1: No urgent items identified | If no Out of Stock or High Stockout Risk items are found after filtering, Inventory Planner notes the healthy position and moves to medium-risk watchlist review. |

| **Includes:** | UC-04: Identify Inventory Stockout Risk |
| **Special Requirements:** | This use case is positioned as a decision-support process, not an automatic replenishment system. Final decisions must incorporate supplier lead time, reorder quantity, safety stock, and operational constraints. |
| **Assumptions:** | The dashboard does not have access to supplier lead times, reorder quantities, or safety stock data. Replenishment decisions remain a human judgment process. |
| **Notes and Issues:** | [TBD-04] Evaluate feasibility of exporting the urgent review list directly from Power BI to a shared replenishment tracker. |
