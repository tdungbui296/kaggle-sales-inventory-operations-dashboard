# Sales, Inventory & Operations Optimization Dashboard  
## Business Summary Report

## 1. Project Purpose

This project analyzes sales, product profitability, store performance, and inventory risk using the Mexico Toy Sales dataset. The objective is to build a practical decision-support dashboard that helps management understand business performance, identify profit drivers, compare store efficiency, and monitor stockout risk.

SQL Server was used to prepare the backend sales and inventory logic. Power BI was used to create an interactive dashboard with executive, product, store, and inventory views.

This project does not attempt to replace a full inventory optimization system. Instead, it provides a practical decision-support layer that combines profitability, store efficiency, and product-store inventory risk to help users prioritize review actions.

---

## 2. Dashboard Decision Outputs

The dashboard produces four business outputs:

| Output | Business Question | Dashboard Page |
|---|---|---|
| Executive Performance View | How is the business performing overall? | Executive Overview |
| Product Action Matrix | Which products should be prioritized, reviewed, or monitored? | Product Analysis |
| Store Efficiency Benchmark | Which store locations perform best by scale and efficiency? | Store Performance |
| Inventory Risk Priority | Which inventory areas need replenishment attention? | Inventory Risk |

The dashboard is therefore not only a reporting tool. It is designed to support product, store, and inventory decisions.

---

## 3. Key Business Results

| KPI | Value |
|---|---:|
| Total Revenue | 14.44M |
| Total Cost | 10.43M |
| Total Profit | 4.01M |
| Profit Margin | 27.79% |
| Units Sold | 1.09M |
| Total Transactions | 829,262 |
| Inventory Value at Cost | $300.21K |
| Stock On Hand | 29.74K |
| High Stockout Risk Items | 359 |
| Out of Stock Items | 77 |
| Urgent Inventory Items | 436 |
| Stockout Risk Rate | 27.37% |

---

## 4. Output-Driven Insights and Actions

### 4.1 Product Insight: Revenue alone is not enough

The Product Analysis page shows that revenue alone can be misleading. Toys generated the highest total profit, while Electronics showed stronger margin efficiency. At product level, Colorbuds stood out as a strong profit and margin performer. Lego Bricks generated high revenue but had a lower margin.

This leads to the following product action matrix:

| Product Type | Dashboard Signal | Action |
|---|---|---|
| Strategic winner | High revenue + high margin | Protect stock availability and prioritize visibility |
| Margin review product | High revenue + weaker margin | Review cost, price, discounts, or promotion strategy |
| Niche profitable product | Lower revenue + high margin | Test targeted promotion or selective expansion |
| Low-priority product | Lower revenue + lower margin | Review assortment relevance |

**Recommended action:**  
Keep Colorbuds as a priority product because it combines strong profit and margin. Review Lego Bricks to understand whether its lower margin is caused by cost, pricing, or promotional strategy.

---

### 4.2 Store Insight: Downtown leads by scale, Airport leads by efficiency

The Store Performance page shows two different views of store performance. Downtown generated the highest total revenue and total profit because it has the largest store base. However, Airport stores generated the highest average revenue per store, average profit per store, and margin.

| Store Location View | Finding | Management Use |
|---|---|---|
| Total profit | Downtown leads | Understand scale contribution |
| Average profit per store | Airport leads | Identify efficiency benchmark |

**Recommended action:**  
Use Downtown as the main scale contributor. Study Airport stores as a benchmark for efficient store performance, then compare whether the same operating pattern can be applied to other store types.

---

### 4.3 Inventory Insight: Urgent stockout risk requires prioritization

The Inventory Risk page identified 436 urgent inventory items, including 359 high-stockout-risk items and 77 out-of-stock items. This gives a stockout risk rate of 27.37%.

The risk categories should be interpreted as an action priority:

| Risk Group | Priority | Action |
|---|---|---|
| Out of Stock | Immediate | Review replenishment first |
| High Stockout Risk | High | Include in short-cycle replenishment review |
| Medium Stockout Risk | Monitor | Add to weekly inventory watchlist |
| Healthy Stock | Maintain | No urgent action |
| No Sales History | Investigate | Check if new stock, dead stock, or data issue |

**Recommended action:**  
Use the dashboard to create a weekly replenishment review focused first on out-of-stock and high-stockout-risk product-store combinations.

---

### 4.4 Inventory Capital Insight: High stock value does not guarantee healthy allocation

Inventory value at cost is approximately $300.21K, with Toys holding the largest inventory value. However, the dashboard still shows urgent risk cases across products and store locations.

This creates an important operational interpretation:

```text
High inventory value + high urgent risk = possible inventory misallocation
```

The business may have enough inventory value overall, but the right stock may not be available in the right stores.

**Recommended action:**  
Monitor inventory at product-store level instead of relying only on total inventory value or category-level stock value.

---

## 5. Practical Management Actions

1. **Weekly replenishment review**  
   Filter the Inventory Risk page for out-of-stock and high-stockout-risk cases. These should be reviewed before medium-risk and healthy-stock items.

2. **Product prioritization list**  
   Use the Product Analysis page to classify products into strategic winners, margin-review products, niche profitable products, and low-priority products.

3. **Margin review for high-revenue products**  
   Products such as Lego Bricks should be reviewed for cost, pricing, discounting, or promotion strategy because high revenue does not automatically mean strong profitability.

4. **Store efficiency benchmarking**  
   Use Airport stores as an efficiency benchmark and Downtown stores as the main scale contributor. This avoids confusing store count with store efficiency.

5. **Category monitoring for Toys**  
   Toys should be monitored closely because it is both a major profit contributor and the category with the highest inventory value.

---

## 6. Limitations

The dashboard provides directional decision support, but it is not a complete replenishment optimization model. The dataset does not include:

- Supplier lead time
- Reorder point
- Reorder quantity
- Safety stock
- Daily inventory history
- Historical stock snapshots
- Lost sales
- Promotion calendar
- Product launch dates
- Customer basket-level data

Because of these limitations, final replenishment decisions should combine this dashboard with additional supply chain and operations data.

---

## 7. Final Business Summary

The dashboard shows that the business is profitable overall, with 14.44M in revenue, 4.01M in profit, and a 27.79% profit margin. However, the project also shows that strong decision-making requires more than revenue tracking.

The most important business outputs are:

1. Product performance should be managed through revenue, margin, profit, and profit per unit.
2. Store performance should separate total contribution from per-store efficiency.
3. Inventory risk should be reviewed at product-store level.
4. High inventory value does not automatically mean healthy stock allocation.

Overall, this project turns sales and inventory data into a practical business review tool for product strategy, store performance evaluation, and inventory-risk monitoring.