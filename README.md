# Sales, Inventory & Operations Optimization Dashboard

## Project Overview

This project analyzes retail sales, product profitability, store performance, and inventory risk using the Mexico Toy Sales dataset. The goal is to build an end-to-end business intelligence project that supports decision-making across revenue performance, product strategy, store efficiency, and stockout-risk monitoring.

The project uses **SQL Server** for backend data modeling and business logic, and **Power BI** for interactive dashboard storytelling.

---

## Business Questions

This project answers the following business questions:

1. How is the business performing overall in revenue, profit, margin, sales volume, and transactions?
2. Which product categories and products generate the most profit?
3. Are high-revenue products always high-margin products?
4. Which stores and store locations perform best?
5. How does total store contribution differ from per-store efficiency?
6. Where is inventory value concentrated?
7. Which product-store combinations are exposed to stockout risk?
8. How can inventory risk be monitored through an operations dashboard?

---

## Tools Used

- **SQL Server Management Studio** — data import, quality checks, SQL views, KPI queries
- **SQL Server** — backend data modeling and business logic
- **Power BI Desktop** — dashboard design, DAX measures, model relationships, visual analytics
- **VS Code** — project documentation
- **GitHub** — portfolio presentation

---

## Dataset

The project uses four main data tables:

| Table | Description | Rows |
|---|---:|---:|
| `sales` | Historical sales transactions | 829,262 |
| `products` | Product master data | 35 |
| `stores` | Store master data | 50 |
| `inventory` | Current inventory by product-store combination | 1,593 |

The raw dataset is stored in the `01_raw_data` folder.

---

## Project Folder Structure

```text
MexicoToySales
│
├── 01_raw_data
│   ├── Mexico.zip
│   └── extracted_csv
│
├── 02_sql
│   ├── 01_data_quality_checks.sql
│   ├── 02_sales_profit_view.sql
│   ├── 03_kpi_analysis.sql
│   ├── 04_inventory_risk_view.sql
│   └── 05_inventory_analysis.sql
│
├── 03_powerbi
│   └── Sales_Inventory_Operations_Dashboard_Final.pbix
│
├── 04_images
│   ├── 01_executive_overview.png
│   ├── 02_product_analysis.png
│   ├── 03_store_performance.png
│   └── 04_inventory_risk.png
│
├── 05_report
│   └── business_summary.md
│
└── README.md
```

---

## SQL Workflow

### 1. Data Quality Checks

SQL was used to validate row counts, inspect data types, check missing values, verify key relationships, detect invalid quantities, and identify sales records without matching current inventory records.

A key data quality finding was that some historical sales product-store combinations did not appear in the current inventory table. This issue was concentrated mainly in **Jenga**, which had 24 missing product-store pairs, 5,773 affected sales rows, and 6,215 units sold. These sales rows were retained for sales and profit analysis, while inventory-risk analysis was interpreted carefully because the inventory table appears to represent a current stock snapshot rather than complete historical inventory coverage.

### 2. Sales-Profit View

The SQL view `dbo.vw_sales_profit` combines sales, product, and store information.

It calculates:

```text
Revenue = Units × Product_Price
Cost = Units × Product_Cost
Profit = Revenue − Cost
```

The view preserved all sales rows:

```text
vw_sales_profit rows = 829,262
sales rows = 829,262
```

### 3. Inventory-Risk View

The SQL view `dbo.vw_inventory_risk` combines current inventory, product, store, and historical sales information.

It calculates:

```text
Inventory Value = Stock_On_Hand × Product_Cost
Avg Daily Sales = Total Units Sold / Product Active Days
Days of Inventory Left = Stock_On_Hand / Avg Daily Sales
```

Inventory records are classified into five risk groups:

| Risk Category | Meaning |
|---|---|
| Out of Stock | Stock is zero but the product has historical demand |
| High Stockout Risk | Estimated inventory left is 7 days or less |
| Medium Stockout Risk | Estimated inventory left is 30 days or less |
| Healthy Stock | Stock level appears sufficient based on historical demand |
| No Sales History | Stock exists but no sales history is available |

The final inventory-risk logic uses product-level active days to avoid penalizing products that started selling later in the dataset.

---

## Power BI Data Model

The Power BI model uses two main analytical views and three dimension tables:

```text
DimProduct → vw_sales_profit
DimProduct → vw_inventory_risk

DimStore → vw_sales_profit
DimStore → vw_inventory_risk

DimDate → vw_sales_profit
```

`DimDate` is intentionally not connected to `vw_inventory_risk` because the inventory table is a current stock snapshot, not a daily historical inventory table.

The model also includes drill-down hierarchies:

```text
Product_Category → Product_Name
Store_Location → Store_City → Store_Name
```

---

## Dashboard Preview

### Executive Overview

![Executive Overview](04_images/1.%20Executive%20overview.png)

### Product Analysis

![Product Analysis](04_images/2.%20Product%20analysis.png)

### Store Performance

![Store Performance](04_images/3.%20Store%20performance.png)

### Inventory Risk

![Inventory Risk](04_images/4.%20Inventory%20risk.png)

---

## Dashboard Pages

### Page 1: Executive Overview

The Executive Overview page provides a high-level view of revenue, profit, profit margin, units sold, inventory value, and urgent inventory risk.

Main visuals include:

- Revenue-to-profit bridge
- Monthly revenue and profit trend
- Profit driver decomposition tree
- Inventory risk distribution

---

### Page 2: Product Analysis

The Product Analysis page identifies strategic products, high-margin products, and volume-driven products.

Main visuals include:

- Product strategic positioning scatter plot
- Product hierarchy profitability matrix
- Top products by profit
- Monthly profit contribution by category

---

### Page 3: Store Performance

The Store Performance page compares total store contribution and per-store efficiency.

Main visuals include:

- Store hierarchy performance matrix
- Store strategic positioning scatter plot
- Total profit by store location
- Average profit per store by location
- Store count mix by location

---

### Page 4: Inventory Risk

The Inventory Risk page monitors current stock value, stockout exposure, and inventory-risk distribution.

Main visuals include:

- Inventory value at cost by product category
- Inventory risk by store location
- Inventory value vs urgent risk by category
- Inventory risk mix by product category

---

## Key DAX Measures

### Sales Measures

```DAX
Total Revenue = SUM(vw_sales_profit[Revenue])

Total Cost = SUM(vw_sales_profit[Cost])

Total Profit = SUM(vw_sales_profit[Profit])

Profit Margin = DIVIDE([Total Profit], [Total Revenue])

Units Sold = SUM(vw_sales_profit[Units])

Total Transactions = DISTINCTCOUNT(vw_sales_profit[Sale_ID])
```

### Store Measures

```DAX
Average Revenue per Store =
DIVIDE(
    [Total Revenue],
    DISTINCTCOUNT(DimStore[Store_ID])
)

Average Profit per Store =
DIVIDE(
    [Total Profit],
    DISTINCTCOUNT(DimStore[Store_ID])
)
```

### Product Measure

```DAX
Profit per Unit =
DIVIDE(
    [Total Profit],
    [Units Sold]
)
```

### Inventory Measures

```DAX
Inventory Value = SUM(vw_inventory_risk[Inventory_Value])

Stock On Hand = SUM(vw_inventory_risk[Stock_On_Hand])

Product-Store Count = COUNTROWS(vw_inventory_risk)

High Stockout Risk Items =
CALCULATE(
    COUNTROWS(vw_inventory_risk),
    vw_inventory_risk[Inventory_Risk] = "High Stockout Risk"
)

Out of Stock Items =
CALCULATE(
    COUNTROWS(vw_inventory_risk),
    vw_inventory_risk[Inventory_Risk] = "Out of Stock"
)

Urgent Inventory Items =
[High Stockout Risk Items] + [Out of Stock Items]

Stockout Risk Rate =
DIVIDE(
    [Urgent Inventory Items],
    [Product-Store Count]
)
```

---

## Main Results

### Executive KPIs

| KPI | Value |
|---|---:|
| Total Revenue | 14.44M |
| Total Cost | 10.43M |
| Total Profit | 4.01M |
| Profit Margin | 27.79% |
| Units Sold | 1.09M |
| Total Transactions | 829,262 |

---

### Inventory KPIs

| KPI | Value |
|---|---:|
| Inventory Value at Cost | $300.21K |
| Stock On Hand | 29.74K |
| High Stockout Risk Items | 359 |
| Out of Stock Items | 77 |
| Urgent Inventory Items | 436 |
| Stockout Risk Rate | 27.37% |

---

## Decision Outputs

The dashboard is designed to produce four practical business outputs:

| Output | Purpose | Dashboard Page |
|---|---|---|
| Product Action Matrix | Classify products by revenue, margin, and profit performance | Product Analysis |
| Store Efficiency Benchmark | Compare store locations by total contribution and per-store efficiency | Store Performance |
| Inventory Risk Priority | Identify categories and locations with stockout exposure | Inventory Risk |
| Executive Performance View | Monitor revenue, profit, margin, and operational risk together | Executive Overview |

These outputs make the dashboard useful not only for reporting, but also for prioritizing product, store, and inventory decisions.

---

## Output-Driven Insights

### 1. Product performance should be managed through an action matrix, not revenue ranking alone

The dashboard shows that high revenue does not always mean strong profitability. Toys generated the highest total profit, while Electronics showed stronger margin performance. At product level, Colorbuds performed strongly because it combined high profit and strong margin. Lego Bricks generated high revenue but had a much lower margin.

This leads to a practical product action matrix:

| Product Type | Dashboard Signal | Management Action |
|---|---|---|
| Strategic winner | High revenue + high margin | Protect stock availability and prioritize visibility |
| Margin review product | High revenue + lower margin | Review cost, pricing, discounts, or promotion strategy |
| Niche profitable product | Lower revenue + high margin | Consider targeted promotion or selective expansion |
| Low-priority product | Lower revenue + lower margin | Review assortment relevance |

**Decision output:**  
Product decisions should combine revenue, profit, margin, units sold, and profit per unit instead of relying on revenue ranking alone.

---

### 2. Store performance should separate total contribution from operating efficiency

Downtown stores generated the highest total revenue and total profit because they represent the largest store group. However, Airport stores showed the strongest average revenue per store, average profit per store, and margin.

This creates two different store management views:

| Store View | Best Use | Business Meaning |
|---|---|---|
| Total Profit by Location | Understand total contribution | Downtown is the largest profit contributor |
| Average Profit per Store | Understand store efficiency | Airport is the strongest per-store performer |

**Decision output:**  
Downtown should be managed as the main scale contributor, while Airport should be studied as an efficiency benchmark.

---

### 3. Inventory risk should be prioritized by urgency, not only by stock value

The inventory dashboard identified 436 urgent inventory items, including 359 high-stockout-risk items and 77 out-of-stock items. The stockout risk rate is 27.37%, meaning a meaningful share of product-store combinations requires operational attention.

A practical inventory risk priority framework is:

| Risk Group | Priority | Action |
|---|---|---|
| Out of Stock | Immediate | Review replenishment need first |
| High Stockout Risk | High | Include in short-cycle replenishment review |
| Medium Stockout Risk | Monitor | Add to weekly inventory watchlist |
| Healthy Stock | Maintain | No urgent action required |
| No Sales History | Investigate | Check whether it is new stock, dead stock, or a data issue |

**Decision output:**  
Inventory review should focus first on out-of-stock and high-stockout-risk product-store combinations.

---

### 4. High inventory value does not automatically mean inventory health

Inventory value at cost is approximately $300.21K, and Toys holds the largest inventory value. However, the dashboard also shows urgent inventory risk across product categories and store locations.

This creates an important operational interpretation:

```text
High inventory value + high urgent risk = possible inventory misallocation
```

This means the business may have enough inventory value overall, but the right products may not be available in the right stores.

**Decision output:**  
Inventory should be monitored at product-store level, not only at category or total stock level.

---

## Business Recommendations

1. **Create a weekly urgent inventory review list**  
   Filter the Inventory Risk page for `Out of Stock` and `High Stockout Risk`. These product-store combinations should be checked first because they represent the highest operational risk.

2. **Use a product action matrix for product planning**  
   Classify products into strategic winners, margin-review products, niche profitable products, and low-priority products. This makes product decisions more practical than ranking products by revenue alone.

3. **Protect strong-margin products such as Colorbuds**  
   Products that combine strong profit and strong margin should be prioritized for stock availability and visibility.

4. **Review high-revenue but lower-margin products such as Lego Bricks**  
   These products should be reviewed for cost structure, pricing, discounting, or promotion strategy.

5. **Use Downtown and Airport for different management purposes**  
   Downtown should be treated as the main scale contributor, while Airport should be treated as a per-store efficiency benchmark.

6. **Monitor Toys as both a profit driver and inventory-risk area**  
   Toys is important because it contributes strongly to profit and holds the largest inventory value. It should be monitored using profit, inventory value, high-risk items, and out-of-stock items together.

7. **Treat the inventory-risk model as a decision-support layer**  
   The dashboard flags directional stockout risk, but final replenishment decisions should also use supplier lead time, reorder points, safety stock, and lost-sales data.

---

## Limitations

This project is limited by the available dataset. Several operational variables are not included:

- Supplier lead time
- Reorder quantity
- Reorder point
- Daily inventory history
- Historical stock snapshots
- Lost sales
- Promotion calendar
- Product launch dates
- Customer basket-level data

Because of these limitations, the inventory-risk classification should be interpreted as a directional indicator rather than a complete replenishment optimization model.

---

## Future Improvements

Future improvements could include:

1. Add reorder point and safety stock logic.
2. Build ABC inventory classification.
3. Add product-store-level demand forecasting.
4. Estimate potential lost sales from stockout conditions.
5. Add drill-through pages for specific products and stores.
6. Publish the dashboard to Power BI Service with scheduled refresh.
7. Build report-page tooltips for deeper product and inventory explanations.

---

## Portfolio Skills Demonstrated

This project demonstrates the ability to:

- Import and validate relational business data
- Use SQL joins, CTEs, views, aggregations, and CASE logic
- Build reusable sales and inventory analysis views
- Create a star-schema-style Power BI model
- Develop DAX measures for business KPIs
- Design an interactive Power BI dashboard with slicers, navigation, hierarchies, scatter plots, decomposition trees, matrices, treemaps, stacked charts, and combo charts
- Translate data analysis into business insights and operational recommendations

---

## Project Summary

This project shows how SQL Server and Power BI can be used together to create a practical retail analytics solution. SQL Server was used to prepare and validate the analytical logic, while Power BI was used to deliver an interactive dashboard for business decision-making.