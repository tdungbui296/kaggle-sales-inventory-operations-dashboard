# Data Dictionary
## Maven Toys Sales & Inventory Operations Optimization

This document covers project-relevant tables, SQL views, fields, and their business meanings as used in the SQL data model and Power BI dashboard. It is intended to support consistent KPI interpretation, data governance, and onboarding of new project contributors.

---

## Source Tables

| Table | Description |
|---|---|
| `sales` | Contains individual sales transaction records |
| `products` | Contains product master data including name, category, price, and cost |
| `stores` | Contains store master data including name, city, and location type |
| `inventory` | Contains current stock-on-hand records per product-store combination |

---

## SQL Views

| View | Description |
|---|---|
| `vw_sales_profit` | Joins sales, products, and stores; calculates Revenue, Cost, and Profit at transaction level |
| `vw_inventory_risk` | Joins inventory and products; calculates Inventory Value, Avg Daily Sales, Days of Inventory Left, and Inventory Risk classification |

---

## Field Reference

### Sales & Transaction Fields

| Field | Source Table / View | Business Meaning | Primary Usage | Notes |
|---|---|---|---|---|
| `Sale_ID` | `sales`, `vw_sales_profit` | Unique identifier for each sales transaction | Transaction count | Used for `DISTINCTCOUNT` in Total Transactions KPI |
| `Date` | `sales`, `vw_sales_profit` | Date of the sales transaction | Trend analysis | Connected to `DimDate` in the Power BI model for correct Month-Year sorting |
| `Units` | `sales` | Quantity sold per transaction line | Revenue, Cost, and Profit calculation | Multiplied by `Product_Price` and `Product_Cost` in SQL views |

### Product Fields

| Field | Source Table / View | Business Meaning | Primary Usage | Notes |
|---|---|---|---|---|
| `Product_ID` | `sales`, `products`, `inventory` | Unique product identifier | Join key across tables | Used to link sales and inventory data |
| `Product_Name` | `products` | Display name of the product | Product-level visuals and rankings | Used in product matrix and top-product visuals |
| `Product_Category` | `products` | Category grouping for the product | Category-level analysis and filtering | Used in slicers and category comparison visuals |
| `Product_Cost` | `products` | Cost per unit at the product level | Cost, Profit, and Inventory Value calculation | Used in SQL views for all cost-derived metrics |
| `Product_Price` | `products` | Selling price per unit | Revenue and Profit calculation | Used in SQL views; treated as valid for the scope of this project |

### Store Fields

| Field | Source Table / View | Business Meaning | Primary Usage | Notes |
|---|---|---|---|---|
| `Store_ID` | `sales`, `stores`, `inventory` | Unique store identifier | Join key; store count in per-store metrics | Used in `DISTINCTCOUNT` for Average Revenue/Profit per Store |
| `Store_Name` | `stores` | Display name of the store | Store-level analysis | Used in the store hierarchy visual |
| `Store_City` | `stores` | City where the store is located | Filtering and geographic grouping | Used in slicers and location comparison |
| `Store_Location` | `stores` | Location type of the store (e.g., Airport, Downtown, Commercial, Residential) | Location-type analysis | Used to compare Airport vs. Downtown performance |

### Calculated Fields in `vw_sales_profit`

| Field | Source View | Calculation | Primary Usage |
|---|---|---|---|
| `Revenue` | `vw_sales_profit` | `Units × Product_Price` | All sales KPIs |
| `Cost` | `vw_sales_profit` | `Units × Product_Cost` | Profit analysis |
| `Profit` | `vw_sales_profit` | `Revenue − Cost` | Core profitability metric |

### Inventory & Risk Fields

| Field | Source Table / View | Business Meaning | Primary Usage | Notes |
|---|---|---|---|---|
| `Stock_On_Hand` | `inventory`, `vw_inventory_risk` | Current quantity available for a product-store combination | Inventory risk classification | Represents a **point-in-time snapshot**, not cumulative movement |
| `Inventory_Value` | `vw_inventory_risk` | Current stock value calculated at cost | Inventory dashboard | `Stock_On_Hand × Product_Cost` |
| `Avg_Daily_Sales` | `vw_inventory_risk` | Estimated average daily demand for the product | Risk estimation | Derived from historical sales data; may be unreliable for newly stocked or slow-moving products |
| `Days_of_Inventory_Left` | `vw_inventory_risk` | Estimated number of days current stock will last | Inventory risk classification | `Stock_On_Hand ÷ Avg_Daily_Sales`; directional metric only |
| `Inventory_Risk` | `vw_inventory_risk` | Rule-based risk category assigned to each product-store record | Inventory risk dashboard and filtering | Categories: Out of Stock, High Stockout Risk, Medium Stockout Risk, Healthy Stock, No Sales History |

---

## Data Quality Notes

- **Inventory snapshot assumption:** The inventory table is treated as a current stock snapshot. It does not capture historical stock levels, inbound shipments, or stock transfers.
- **Missing inventory records:** Some product-store combinations present in the sales data may not have a corresponding inventory record. These records are retained in `vw_sales_profit` but should be interpreted cautiously in `vw_inventory_risk`.
- **Sales velocity reliability:** `Avg_Daily_Sales` is estimated from historical sales and may not accurately reflect demand for new products, seasonal items, or products with limited sales history.
- **Price and cost stability:** `Product_Price` and `Product_Cost` are treated as stable values for the purpose of this project. Promotional pricing or cost changes over time are not modeled.
