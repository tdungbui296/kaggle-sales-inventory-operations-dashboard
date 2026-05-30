# User Stories & Acceptance Criteria
## Maven Toys Sales & Inventory Operations Optimization

Stories are written in Agile BA format following the INVEST criteria. Acceptance Criteria use Given-When-Then (Gherkin) syntax. All stories are tracked on the Jira Kanban board under the project key **KAN**.

---

## Epic Overview

| Epic ID | Epic Name | Stories |
|---|---|---|
| KAN-1 | Executive Performance Overview | KAN-6, KAN-7 |
| KAN-2 | Product Profitability Analysis | KAN-8, KAN-9 |
| KAN-3 | Store & Location Performance Analysis | KAN-10, KAN-11 |
| KAN-4 | Inventory Risk Review | KAN-12, KAN-13, KAN-14 |
| KAN-5 | Data Quality & KPI Governance | KAN-15, KAN-16 |

---

## Priority Reference

| Priority | Rationale | Stories |
|---|---|---|
| **Highest** | Critical foundation or core decision feature. Missing this causes major loss of business value or KPI trust. | KAN-6, KAN-12, KAN-13, KAN-15 |
| **High** | Strong business value and important stakeholder decision support, but not the absolute foundation. | KAN-8, KAN-9, KAN-11, KAN-16 |
| **Medium** | Useful supporting analysis or interpretation, but less critical than core KPI/risk logic. | KAN-7, KAN-10, KAN-14 |

---

## Epic: Executive Performance Overview

### KAN-6 — View Executive KPI Summary

**Priority:** Highest | **Status:** Done

> **As an** Executive Manager,
> **I want to** view a consolidated summary of revenue, profit, margin, units sold, inventory value, and urgent inventory items on a single dashboard page,
> **So that** I can assess overall business health and operational risk exposure without navigating multiple reports.

**INVEST Check:**

| Criteria | Status | Note |
|---|---|---|
| Independent | ✅ | Does not depend on other stories to deliver value |
| Negotiable | ✅ | KPI selection and layout are open for stakeholder discussion |
| Valuable | ✅ | Directly supports executive management review |
| Estimable | ✅ | Scope is well-defined: KPI cards + filters + documentation |
| Small | ✅ | Deliverable within one sprint |
| Testable | ✅ | Values can be validated against SQL outputs |

**Acceptance Criteria:**

**AC1: Executive KPI cards display correctly**
- **Given** the Executive Summary page is open and data has been refreshed
- **When** the Executive Manager views the KPI section
- **Then** the dashboard displays KPI cards for Total Revenue, Total Cost, Total Profit, Profit Margin, Units Sold, Inventory Value, and Urgent Inventory Items
- **And** all KPI values match the corresponding validated SQL query outputs

**AC2: Filters function across all KPI cards**
- **Given** the Executive Manager is on the Executive Summary page
- **When** the manager applies a filter by Year, Store Location, Product Category, or Store City
- **Then** all KPI cards update to reflect the filtered scope
- **And** no KPI card retains values from outside the applied filter

**AC3: KPI definitions are accessible**
- **Given** a KPI card is displayed on the dashboard
- **When** a stakeholder needs to understand what the KPI measures
- **Then** the KPI definition, formula, and source view can be found in the KPI Dictionary documentation
- **And** the definition matches the logic implemented in the SQL view or Power BI measure

---

### KAN-7 — Monitor Monthly Revenue and Profit Trend

**Priority:** Medium | **Status:** To Do

> **As an** Executive Manager,
> **I want to** view a monthly trend chart showing revenue and profit over time,
> **So that** I can identify seasonal patterns, growth trends, and months that require investigation.

**Acceptance Criteria:**

**AC1: Monthly trend chart renders correctly**
- **Given** the Executive Summary page is open
- **When** the Executive Manager views the trend section
- **Then** a line or bar chart displays Total Revenue and Total Profit grouped by Month-Year
- **And** Month-Year is sorted chronologically, not alphabetically

**AC2: Trend values align with KPI card totals**
- **Given** no filters are applied
- **When** the Executive Manager sums the monthly revenue values shown in the trend chart
- **Then** the summed total matches the Total Revenue KPI card value

**AC3: Trend responds to year filter**
- **Given** the Executive Manager applies a Year filter
- **When** the filtered year is selected
- **Then** the trend chart updates to show only the months within the selected year

---

## Epic: Product Profitability Analysis

### KAN-8 — Compare Product Category Profitability

**Priority:** High | **Status:** Done

> **As a** Product / Merchandising Manager,
> **I want to** compare product categories across revenue, profit, margin, units sold, and profit per unit in a single view,
> **So that** I can identify which categories are the strongest profit contributors and where margin improvement opportunities exist.

**Acceptance Criteria:**

**AC1: Category profitability matrix displays all required KPIs**
- **Given** the Product Profitability Analysis page is open
- **When** the Product Manager views the category comparison section
- **Then** the dashboard displays Revenue, Profit, Profit Margin, Units Sold, and Profit per Unit for each product category
- **And** categories can be ranked by each KPI

**AC2: KPI logic is documented**
- **Given** a stakeholder reviews the category profitability data
- **When** they want to verify how Profit per Unit is calculated
- **Then** the formula (`Total Profit ÷ Units Sold`) and source are documented in the KPI Dictionary

**AC3: Category filter narrows the product view**
- **Given** the Product Manager selects a specific category from the filter
- **When** the filter is applied
- **Then** all product-level visuals update to show only products within the selected category

---

### KAN-9 — Identify Product Action Groups

**Priority:** High | **Status:** In Progress

> **As a** Product / Merchandising Manager,
> **I want to** identify products that are high-revenue/high-margin, high-revenue/lower-margin, or lower-performing,
> **So that** I can prioritize the right products for promotion, cost review, or de-listing decisions.

**Acceptance Criteria:**

**AC1: Revenue vs. margin scatter chart renders at product level**
- **Given** the Product Profitability Analysis page is open
- **When** the Product Manager views the product positioning visual
- **Then** a scatter chart displays each product plotted by Revenue (x-axis) and Profit Margin (y-axis)
- **And** hovering over a data point reveals the product name, revenue, margin, and profit

**AC2: Top products by profit are visible**
- **Given** the Product Manager wants to identify profit drivers
- **When** they view the top products ranking visual
- **Then** products are ranked by Total Profit in descending order
- **And** the top 10 products are visible without scrolling

**AC3: Recommendations are documented for product action groups**
- **Given** the dashboard identifies a high-revenue product with a margin below a defined threshold
- **When** the Product Manager consults the Business Recommendations documentation
- **Then** a documented recommendation exists for how to handle high-revenue / lower-margin products

---

## Epic: Store & Location Performance Analysis

### KAN-10 — Compare Store Locations by Total Contribution

**Priority:** Medium | **Status:** In Progress

> **As a** Store Operations Manager,
> **I want to** see total revenue and profit grouped by store location,
> **So that** I can understand which locations generate the highest overall business contribution.

**Acceptance Criteria:**

**AC1: Total revenue and profit display by location**
- **Given** the Store & Location Performance page is open
- **When** the Store Operations Manager views the location summary
- **Then** Total Revenue and Total Profit are displayed for each store location
- **And** results align with validated SQL measures

**AC2: Store hierarchy supports location drill-down**
- **Given** the Store Operations Manager selects a store location
- **When** they drill into the hierarchy
- **Then** the visual expands to show individual stores within the selected location

**AC3: Location filter works correctly**
- **Given** the Store Operations Manager applies a location filter
- **When** a location is selected
- **Then** all store performance visuals update to reflect only stores within that location

---

### KAN-11 — Compare Store Locations by Per-Store Efficiency

**Priority:** High | **Status:** Done

> **As a** Store Operations Manager,
> **I want to** compare store locations using average revenue and average profit per store,
> **So that** I can benchmark true store efficiency independently of how many stores each location has.

**Acceptance Criteria:**

**AC1: Average revenue and profit per store display by location**
- **Given** the Store & Location Performance page is open
- **When** the Store Operations Manager views the per-store efficiency section
- **Then** Average Revenue per Store and Average Profit per Store are shown for each location
- **And** the store count used in the denominator is visible alongside the averages

**AC2: Downtown vs. Airport interpretation is documented**
- **Given** Downtown leads in total revenue but Airport leads in average revenue per store
- **When** a stakeholder consults the dashboard or related documentation
- **Then** the interpretation distinguishing scale effect from per-store efficiency is documented in Business Recommendations

**AC3: Per-store values match manual calculation**
- **Given** the Total Revenue and store count for a location are known
- **When** the BI Analyst divides Total Revenue by store count
- **Then** the result matches the Average Revenue per Store value displayed in the dashboard

---

## Epic: Inventory Risk Review

### KAN-12 — Classify Inventory Risk

**Priority:** Highest | **Status:** Done

> **As an** Inventory Planner,
> **I want** inventory records classified into risk categories,
> **So that** I can prioritize inventory review actions by urgency rather than reviewing all records manually.

**Acceptance Criteria:**

**AC1: Risk categories are correctly assigned**
- **Given** the inventory-risk view has been refreshed
- **When** the Inventory Planner opens the Inventory Risk & Replenishment page
- **Then** each product-store record is classified as one of: Out of Stock, High Stockout Risk, Medium Stockout Risk, Healthy Stock, or No Sales History
- **And** no product-store record is left unclassified

**AC2: Risk logic uses the correct inputs**
- **Given** a product-store record is under review
- **When** the BI Analyst validates the risk classification
- **Then** the classification uses Stock On Hand, historical sales velocity (Avg Daily Sales), and Days of Inventory Left
- **And** the logic is documented in the KPI Dictionary

**AC3: Risk assumptions are documented**
- **Given** a stakeholder wants to understand the boundaries of the risk model
- **When** they consult the Assumptions & Limitations documentation
- **Then** the inventory snapshot assumption, limitations (no lead time, no safety stock), and interpretation boundary are clearly documented

---

### KAN-13 — Prioritize Urgent Inventory Review Items

**Priority:** Highest | **Status:** In Review

> **As an** Inventory Planner,
> **I want to** see Out of Stock and High Stockout Risk items highlighted and filterable in the dashboard,
> **So that** I can focus my weekly review effort on the items most likely to impact product availability.

**Acceptance Criteria:**

**AC1: Urgent Inventory Items KPI card displays correctly**
- **Given** the Inventory Risk & Replenishment page is open
- **When** the Inventory Planner views the KPI section
- **Then** the Urgent Inventory Items card displays the total count of Out of Stock and High Stockout Risk records combined

**AC2: Urgent items can be filtered and isolated**
- **Given** the Inventory Planner wants to focus only on urgent records
- **When** they filter the risk visual to show only Out of Stock and High Stockout Risk
- **Then** all visuals on the page update to display only the filtered urgent records
- **And** the Urgent Inventory Items count matches the number of visible records

**AC3: Stockout Risk Rate is visible and interpretable**
- **Given** the Inventory Planner is assessing overall exposure
- **When** they view the Stockout Risk Rate KPI card
- **Then** the rate is displayed as a percentage representing urgent items divided by total product-store count
- **And** the calculation basis is documented in the KPI Dictionary

---

### KAN-14 — Review No-Sales-History Inventory Items

**Priority:** Medium | **Status:** In Review

> **As an** Inventory Planner,
> **I want** No Sales History inventory items separated and clearly labelled in the dashboard,
> **So that** I do not treat them as automatic stockout risks and can investigate them appropriately.

**Acceptance Criteria:**

**AC1: No Sales History items appear as a distinct category**
- **Given** the Inventory Risk & Replenishment page is open
- **When** the Inventory Planner views the risk distribution visual
- **Then** No Sales History appears as a separate category from Out of Stock, High Stockout Risk, Medium Stockout Risk, and Healthy Stock

**AC2: No Sales History items are excluded from the Urgent Inventory Items count**
- **Given** a product-store record is classified as No Sales History
- **When** the Urgent Inventory Items KPI is calculated
- **Then** No Sales History records are not counted in the Urgent Inventory Items total

**AC3: Interpretation guidance is documented**
- **Given** a stakeholder wants to understand what to do with No Sales History items
- **When** they consult the Inventory Risk Review Decision Flow or Assumptions documentation
- **Then** guidance is provided explaining that these items may be newly stocked, slow-moving, or affected by data coverage issues

---

## Epic: Data Quality & KPI Governance

### KAN-15 — Validate Sales-Profit View

**Priority:** Highest | **Status:** Done

> **As a** BI / Data Analyst,
> **I want** the sales-profit SQL view validated to confirm it preserves all sales rows and applies correct KPI formulas,
> **So that** all dashboard stakeholders can trust the revenue, cost, and profit values displayed.

**Acceptance Criteria:**

**AC1: Row count validation passes**
- **Given** the `vw_sales_profit` view has been created
- **When** the BI Analyst runs a row count validation script against the source `sales` table
- **Then** the row count in `vw_sales_profit` matches the row count in `sales` with no rows dropped

**AC2: Revenue, cost, and profit formulas are correct**
- **Given** a sample set of sales records is selected for spot-check
- **When** the BI Analyst manually calculates `Units × Product_Price` and `Units × Product_Cost`
- **Then** the Revenue and Cost values in `vw_sales_profit` match the manual calculation for all spot-checked records

**AC3: KPI values in the dashboard match SQL outputs**
- **Given** the dashboard is connected to the validated SQL view
- **When** the BI Analyst compares Total Revenue and Total Profit between the dashboard KPI cards and a direct SQL aggregate query
- **Then** the values are identical with no unexplained discrepancy

---

### KAN-16 — Document Assumptions and Limitations

**Priority:** High | **Status:** Done

> **As a** project stakeholder,
> **I want** all inventory-risk assumptions, data limitations, and interpretation boundaries documented in one place,
> **So that** the dashboard is used responsibly as a decision-support tool rather than an automatic replenishment system.

**Acceptance Criteria:**

**AC1: Inventory snapshot assumption is documented**
- **Given** a stakeholder is interpreting inventory-risk results
- **When** they consult the Assumptions & Limitations documentation
- **Then** they find a clear statement that inventory data represents a current stock snapshot, not historical movement

**AC2: Key data limitations are listed with business impact**
- **Given** a stakeholder wants to understand what the dashboard cannot tell them
- **When** they read the Limitations section
- **Then** limitations including no supplier lead time, no reorder point, no safety stock, no daily inventory history, and no lost sales data are listed with their respective business impacts

**AC3: Interpretation boundary statement is present**
- **Given** the documentation is reviewed by a new stakeholder
- **When** they reach the end of the Assumptions & Limitations page
- **Then** a clear interpretation boundary statement explains that the inventory-risk model is a decision-support layer and that final replenishment decisions require additional operational inputs
