# KPI Dictionary
## Maven Toys Sales & Inventory Operations Optimization

This document defines each KPI used in the Power BI dashboard, including its business definition, calculation formula, data source, dashboard page placement, and business interpretation guide.

---

## Sales & Profitability KPIs

| KPI Name | Business Definition | Formula / Logic | Source View | Dashboard Page | Business Interpretation |
|---|---|---|---|---|---|
| **Total Revenue** | Total sales value generated | `Units × Product_Price` | `vw_sales_profit` | Executive Summary, Product Profitability, Store & Location | Measures overall sales scale; does not reflect profitability efficiency |
| **Total Cost** | Total product cost incurred | `Units × Product_Cost` | `vw_sales_profit` | Executive Summary | Measures cost base to support margin calculation |
| **Total Profit** | Revenue after deducting cost | `Revenue − Cost` | `vw_sales_profit` | All sales pages | Primary profitability indicator |
| **Profit Margin** | Profit as a percentage of revenue | `Profit ÷ Revenue` | `vw_sales_profit` | Executive Summary, Product Profitability, Store & Location | Shows profitability efficiency; use alongside Total Profit to avoid margin-only bias |
| **Units Sold** | Total quantity of units sold | `SUM(Units)` | `vw_sales_profit` | Executive Summary, Product Profitability, Store & Location | Measures sales volume independent of price |
| **Total Transactions** | Number of distinct sales records | `DISTINCTCOUNT(Sale_ID)` | `vw_sales_profit` | Executive Summary | Measures transaction volume; supports average basket analysis |

---

## Product-Level KPIs

| KPI Name | Business Definition | Formula / Logic | Source | Dashboard Page | Business Interpretation |
|---|---|---|---|---|---|
| **Profit per Unit** | Profit generated per unit sold | `Total Profit ÷ Units Sold` | Power BI measure | Product Profitability Analysis | Supports unit economics comparison; helps identify high-margin products regardless of volume |

---

## Store & Location KPIs

| KPI Name | Business Definition | Formula / Logic | Source | Dashboard Page | Business Interpretation |
|---|---|---|---|---|---|
| **Average Revenue per Store** | Revenue divided by the number of distinct stores | `Revenue ÷ DISTINCTCOUNT(Store_ID)` | Power BI measure | Store & Location Performance | Separates location scale from store efficiency; prevents larger locations from dominating the comparison |
| **Average Profit per Store** | Profit divided by the number of distinct stores | `Profit ÷ DISTINCTCOUNT(Store_ID)` | Power BI measure | Store & Location Performance | Shows per-store profitability efficiency across locations |

---

## Inventory Risk KPIs

| KPI Name | Business Definition | Formula / Logic | Source View | Dashboard Page | Business Interpretation |
|---|---|---|---|---|---|
| **Inventory Value** | Current stock value calculated at cost | `Stock_On_Hand × Product_Cost` | `vw_inventory_risk` | Inventory Risk & Replenishment | Shows capital tied in inventory; does not indicate whether items are available in the right stores |
| **Stock On Hand** | Available inventory quantity | `SUM(Stock_On_Hand)` | `vw_inventory_risk` | Inventory Risk & Replenishment | Measures current stock availability as a snapshot; not a historical movement metric |
| **Days of Inventory Left** | Estimated number of days of stock coverage remaining | `Stock_On_Hand ÷ Avg_Daily_Sales` | `vw_inventory_risk` | Inventory Risk & Replenishment | Directional stock coverage metric; used to classify risk category; interpret with caution where sales velocity is irregular |
| **High Stockout Risk Items** | Count of product-store records classified as High Stockout Risk | `COUNT(rows where Inventory_Risk = 'High Stockout Risk')` | `vw_inventory_risk` | Inventory Risk & Replenishment | Identifies items requiring near-term replenishment review |
| **Out of Stock Items** | Count of product-store records with zero stock and confirmed historical demand | `COUNT(rows where Inventory_Risk = 'Out of Stock')` | `vw_inventory_risk` | Inventory Risk & Replenishment | Identifies immediate product availability issues |
| **Urgent Inventory Items** | Combined count of High Stockout Risk and Out of Stock records | `High Stockout Risk Items + Out of Stock Items` | Power BI measure | Executive Summary, Inventory Risk & Replenishment | Top-priority action list for weekly inventory review |
| **Stockout Risk Rate** | Share of all product-store records flagged as urgent | `Urgent Inventory Items ÷ Total Product-Store Count` | Power BI measure | Inventory Risk & Replenishment | Measures overall stockout exposure across the portfolio |

---

## Inventory Risk Classification Reference

| Risk Category | Definition | Recommended Action |
|---|---|---|
| **Out of Stock** | Zero stock on hand with historical sales demand | Add to urgent inventory review list immediately |
| **High Stockout Risk** | Very low days of inventory left based on sales velocity | Add to priority replenishment review list |
| **Medium Stockout Risk** | Moderate stock coverage; approaching risk threshold | Add to weekly inventory watchlist |
| **No Sales History** | No historical demand available to estimate risk | Review separately; do not classify as automatic stockout risk |
| **Healthy Stock** | Adequate stock coverage relative to sales velocity | No immediate action required |

---

## KPI Governance Notes

- All sales KPIs are calculated from `vw_sales_profit`, which preserves all sales rows and applies the `Units × Price` and `Units × Cost` formulas.
- All inventory KPIs are calculated from `vw_inventory_risk`, which treats inventory as a **current stock snapshot**, not a historical movement log.
- KPI values in the dashboard must be validated against SQL query outputs before use in business review.
- Inventory-risk KPIs are **directional indicators** and should not be used as automatic replenishment triggers.
