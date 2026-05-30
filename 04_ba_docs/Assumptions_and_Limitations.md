# Assumptions & Limitations
## Maven Toys Sales & Inventory Operations Optimization

This document clarifies the assumptions underlying the dashboard and inventory-risk model, the data limitations that constrain its analytical scope, and the interpretation boundaries that prevent overclaiming. It is intended to be read alongside dashboard outputs, especially before making replenishment or strategic decisions.

---

## 1. Assumptions

These are beliefs that were accepted as true during analysis. They have not been independently verified but are considered reasonable given the available dataset.

| # | Assumption | Interpretation |
|---|---|---|
| A1 | Inventory data is treated as a current stock snapshot. | Inventory-risk results reflect current stock availability rather than historical stock movement. The model does not capture inbound shipments, stock transfers, or consumption over time. |
| A2 | Historical sales data is used as a proxy for demand. | Units sold in the `sales` table are used to estimate average daily sales velocity (`Avg_Daily_Sales`) and therefore days of inventory left. This assumes past demand is a reasonable indicator of near-term demand. |
| A3 | `Product_Price` and `Product_Cost` are treated as stable values for the project scope. | Revenue, cost, profit, and margin are calculated using the product master price and cost fields. Promotional pricing changes, temporary discounts, and cost fluctuations over time are not modeled. |
| A4 | Inventory risk classification is directional, not prescriptive. | Risk categories (Out of Stock, High Stockout Risk, Medium Stockout Risk, Healthy Stock, No Sales History) are intended to guide review prioritization. They are not automated replenishment triggers. |
| A5 | Each row in the `sales` table represents a valid sales transaction. | No returns, cancellations, or duplicate transaction filtering has been applied. The view `vw_sales_profit` preserves all rows from the source `sales` table. |

---

## 2. Limitations

These are known constraints of the dataset or project scope that affect what the dashboard can and cannot answer.

### Data Availability Limitations

| # | Limitation | Business Impact |
|---|---|---|
| L1 | No supplier lead time data | Cannot calculate precise reorder timing or determine when stock should be ordered to avoid a stockout |
| L2 | No reorder point data | Cannot define formal stock trigger thresholds for automated or rule-based replenishment |
| L3 | No reorder quantity data | Cannot recommend exact quantities for replenishment orders |
| L4 | No safety stock data | Cannot account for demand variability or buffer stock requirements |
| L5 | No daily historical inventory snapshots | Cannot analyze stock movement, consumption patterns, or shrinkage over time |
| L6 | No lost sales data | Cannot quantify revenue or profit that was lost due to stockout events |
| L7 | No promotion calendar | Cannot separate promotion-driven demand spikes from baseline demand when estimating sales velocity |
| L8 | No product launch dates | Newly introduced products may have shorter sales histories, causing underestimated demand and potentially incorrect risk classification |

### Data Coverage Limitations

| # | Limitation | Business Impact |
|---|---|---|
| L9 | Some product-store combinations in the sales data have no corresponding inventory record | These rows are retained in `vw_sales_profit` for sales KPI accuracy but are excluded from inventory-risk classification; results may undercount the true number of at-risk records |
| L10 | No customer-level data (basket, demographic, or loyalty) | Customer segmentation, basket analysis, and cohort-level demand estimation are out of scope |
| L11 | No promotion or campaign fields | Promotion effectiveness analysis cannot be performed with the current dataset |

---

## 3. Interpretation Boundaries

### Inventory Risk Model

The inventory-risk model is a **decision-support layer**, not an automated replenishment system. It helps stakeholders identify likely stockout exposure and prioritize review, but it does not replace operational judgment.

Final replenishment decisions must incorporate:
- Supplier lead times and availability
- Reorder rules and minimum order quantities
- Safety stock and buffer requirements
- Promotion plans and upcoming demand events
- Operational constraints such as storage capacity and budget

### Revenue vs. Profitability

Total revenue alone is not a reliable indicator of business health. A product or store that ranks highly by revenue may have weak margins and lower profit efficiency. Always review revenue alongside profit margin and profit per unit before drawing strategic conclusions.

### Store Performance

Total location performance is influenced by the number of stores in each location. A location with a higher store count will naturally generate more total revenue and profit even if individual stores underperform. **Average Revenue per Store** and **Average Profit per Store** are the correct metrics for efficiency benchmarking.

### No Sales History Items

Inventory records classified as **No Sales History** should not be treated as stockout risks. These items may be:
- Newly stocked products with insufficient demand history
- Slow-moving or seasonal items
- Products mismatched to the store's customer profile
- Affected by data coverage gaps

These items require a separate investigation process outside the standard urgency review workflow.

---

## 4. Recommended Usage

| Scenario | Recommended Approach |
|---|---|
| Weekly inventory review | Use Out of Stock and High Stockout Risk filters to build the urgent review list; treat outputs as starting points for operational discussion, not final orders |
| Product strategy decisions | Use revenue, profit, margin, and profit per unit together; do not rank products by revenue alone |
| Store benchmarking | Use Average Revenue/Profit per Store for efficiency comparison; use Total Revenue/Profit only for scale contribution analysis |
| New stakeholder onboarding | Share this document alongside the KPI Dictionary before presenting dashboard findings |
