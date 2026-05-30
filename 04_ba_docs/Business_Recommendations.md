# Business Recommendations
## Maven Toys Sales & Inventory Operations Optimization

This document translates dashboard findings into actionable business recommendations for product strategy, store performance management, and inventory-risk prioritization. Each recommendation is linked to specific dashboard evidence and directed at the relevant stakeholder(s).

---

## Summary Table

| # | Recommendation | Priority | Primary Stakeholder |
|---|---|---|---|
| R1 | Establish a weekly urgent inventory review process | Highest | Inventory Planner, Store Operations Manager |
| R2 | Treat inventory-risk outputs as review priorities, not automatic replenishment orders | Highest | Inventory Planner, BI / Data Analyst |
| R3 | Use Airport stores as the efficiency benchmark | High | Store Operations Manager |
| R4 | Separate total location contribution from per-store efficiency in benchmarking decisions | High | Executive Manager, Store Operations Manager |
| R5 | Review high-revenue but lower-margin products separately | High | Product / Merchandising Manager |
| R6 | Monitor the Toys category as both a profit driver and an inventory exposure area | High | Product / Merchandising Manager, Inventory Planner |

---

## R1 — Establish a Weekly Urgent Inventory Review Process

**Priority:** Highest
**Stakeholders:** Inventory Planner, Store Operations Manager

### Dashboard Finding
The dashboard identifies **436 urgent inventory items**: 359 classified as High Stockout Risk and 77 classified as Out of Stock. The overall **Stockout Risk Rate is 27.37%**, meaning more than one in four product-store combinations currently show signs of elevated stockout exposure.

### Recommendation
Establish a formal weekly review process for all product-store records flagged as **Out of Stock** or **High Stockout Risk**. The Inventory Planner should use the Inventory Risk & Replenishment dashboard page to filter, sort, and export the urgent review list at the start of each week, then share it with the Procurement / Buying Team for replenishment coordination.

### Expected Outcome
- Stockout events are identified and acted upon before they impact customer-facing product availability.
- The replenishment team operates from a structured priority list rather than reactive store-level reports.
- The Stockout Risk Rate KPI can be tracked week-over-week as a measure of process effectiveness.

### Action Steps
1. Filter the Inventory Risk dashboard to Out of Stock and High Stockout Risk.
2. Export or record the urgent product-store list.
3. Review category and location distribution to identify concentration areas.
4. Coordinate with the Procurement / Buying Team for supplier-order follow-up.
5. Track whether urgent items are resolved in the following week's review.

---

## R2 — Treat Inventory-Risk Outputs as Review Priorities, Not Automatic Replenishment Orders

**Priority:** Highest
**Stakeholders:** Inventory Planner, BI / Data Analyst

### Dashboard Finding
Total inventory value is approximately **$300,210**. However, the dataset does not include supplier lead time, reorder quantity, safety stock, lost sales data, promotion calendar information, or daily inventory history.

### Recommendation
The inventory-risk classification should be treated as a **decision-support input**, not a replenishment trigger. Before placing orders, the Inventory Planner and Procurement Team must validate:
- Whether the supplier can fulfill the order within an acceptable lead time
- Whether the product is still active and not due for discontinuation
- Whether demand is influenced by an upcoming promotion or seasonal event
- Whether inventory records are accurate or require a physical stock check

### Expected Outcome
- Replenishment decisions are better informed and avoid over-ordering on inactive or promotional products.
- The team does not overcommit purchasing budget based on model outputs that lack full operational context.

---

## R3 — Use Airport Stores as the Efficiency Benchmark

**Priority:** High
**Stakeholders:** Store Operations Manager

### Dashboard Finding
The **Airport location has the highest Average Profit per Store ($126,016.33) and the highest Profit Margin (29.31%)** among all store location types, even though it has fewer total stores than Downtown.

### Recommendation
When evaluating store performance, use **Airport stores as the efficiency benchmark** rather than comparing all locations by total revenue or total profit alone. Airport stores represent the standard for what a well-performing store should generate on a per-store basis.

### Expected Outcome
- Store performance reviews focus on efficiency rather than scale.
- Expansion decisions consider per-store profit potential, not just total location size.
- Underperforming stores in any location type can be compared against the Airport benchmark to identify gaps.

---

## R4 — Separate Total Location Contribution from Per-Store Efficiency in Benchmarking Decisions

**Priority:** High
**Stakeholders:** Executive Manager, Store Operations Manager

### Dashboard Finding
**Downtown has the largest total profit** across all locations, partly because it contains **29 stores**. However, its average profit per store and average margin are lower than Airport's. A revenue-only or total-profit-only view would incorrectly position Downtown as the strongest-performing location type.

### Recommendation
Use a **two-metric framework** for all store and location benchmarking:
- **Total Revenue and Total Profit** → to measure overall business contribution and location scale
- **Average Revenue per Store and Average Profit per Store** → to measure genuine per-store operational efficiency

Never use total performance alone as the basis for store investment, expansion, or closure decisions.

### Expected Outcome
- Location strategy decisions are based on efficiency-adjusted performance rather than raw scale.
- High-store-count locations are not automatically treated as high-performance locations.
- Smaller but more efficient locations receive appropriate strategic attention.

---

## R5 — Review High-Revenue but Lower-Margin Products Separately

**Priority:** High
**Stakeholders:** Product / Merchandising Manager

### Dashboard Finding
**Lego Bricks** generates high revenue but carries a **low margin of 12.50%**. In contrast, **Colorbuds** is the strongest single product by both absolute profit ($834,944) and margin (53.37%). These two products represent the two ends of the revenue-margin spectrum and require different strategic treatment.

### Recommendation
Implement a **two-track product review process**:

1. **Protect high-margin profit drivers** (e.g., Colorbuds): Ensure these products have sufficient inventory coverage, appropriate shelf space, and are not discounted unnecessarily.

2. **Review high-revenue / lower-margin products** (e.g., Lego Bricks): Investigate whether the margin is constrained by supplier cost, pricing strategy, or promotional activity. Evaluate whether the revenue volume justifies the lower margin or whether a pricing or cost renegotiation is warranted.

### Expected Outcome
- Product strategy is guided by a balanced view of revenue and profitability.
- High-margin products receive protection from unnecessary discounting.
- Lower-margin, high-revenue products are investigated for improvement rather than automatically retained or removed.

---

## R6 — Monitor the Toys Category as Both a Profit Driver and an Inventory Exposure Area

**Priority:** High
**Stakeholders:** Product / Merchandising Manager, Inventory Planner

### Dashboard Finding
The **Toys category is the highest-profit product category** and simultaneously carries the **highest inventory value at approximately $99,860**. This dual position means that stockout events in the Toys category would have a disproportionately large impact on both revenue and customer satisfaction.

### Recommendation
The Toys category should be treated as a **high-priority area for both product strategy and inventory monitoring**:
- Product / Merchandising Manager should monitor Toys category margin and unit economics closely, as volume-driven categories may have lower per-unit margin.
- Inventory Planner should apply heightened attention to Toys in the weekly urgent review, given the category's high inventory value and potential for concentrated stockout exposure.

### Expected Outcome
- The Toys category receives cross-functional attention from both product and inventory stakeholders.
- High-value inventory in the Toys category is actively managed to avoid both overstock and stockout situations.
- Category-level inventory risk is tracked alongside revenue and profit performance in management reviews.

---

## Final Business Interpretation

Strong retail decision-making requires more than revenue tracking. The Maven Toys dashboard demonstrates that:

- **Products** should be evaluated through revenue, profit, margin, and unit economics together — not by revenue rank alone.
- **Stores** should be compared using both total contribution (for scale) and per-store efficiency (for performance quality).
- **Inventory** should be monitored at the product-store level, not just as a total inventory value figure.

The most significant risk in the current data environment is over-reliance on total figures (total revenue, total inventory value) that can mask material differences in margin quality, store efficiency, and stockout exposure across the portfolio.
