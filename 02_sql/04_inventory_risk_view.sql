USE ToySalesPortfolio;
GO

CREATE OR ALTER VIEW dbo.vw_inventory_risk AS
WITH date_bounds AS (
    SELECT
        MIN([Date]) AS First_Sales_Date,
        MAX([Date]) AS Last_Sales_Date
    FROM dbo.sales
),

product_sales AS (
    SELECT
        Store_ID,
        Product_ID,
        SUM(Units) AS Total_Units_Sold,
        COUNT(DISTINCT [Date]) AS Selling_Days,
        MIN([Date]) AS First_Sale_Date,
        MAX([Date]) AS Last_Product_Sale_Date
    FROM dbo.sales
    GROUP BY Store_ID, Product_ID
),

inventory_base AS (
    SELECT
        i.Store_ID,
        st.Store_Name,
        st.Store_City,
        st.Store_Location,
        st.Store_Open_Date,
        i.Product_ID,
        p.Product_Name,
        p.Product_Category,
        p.Product_Cost,
        p.Product_Price,
        i.Stock_On_Hand,

        COALESCE(ps.Total_Units_Sold, 0) AS Total_Units_Sold,
        COALESCE(ps.Selling_Days, 0) AS Selling_Days,
        ps.First_Sale_Date,
        ps.Last_Product_Sale_Date,

        db.First_Sales_Date,
        db.Last_Sales_Date,

        CASE 
            WHEN st.Store_Open_Date > db.First_Sales_Date 
                THEN st.Store_Open_Date
            ELSE db.First_Sales_Date
        END AS Active_Start_Date,

        CASE
            WHEN ps.First_Sale_Date IS NOT NULL
                THEN ps.First_Sale_Date
            WHEN st.Store_Open_Date > db.First_Sales_Date
                THEN st.Store_Open_Date
            ELSE db.First_Sales_Date
        END AS Product_Active_Start_Date

    FROM dbo.inventory i
    JOIN dbo.products p
        ON i.Product_ID = p.Product_ID
    JOIN dbo.stores st
        ON i.Store_ID = st.Store_ID
    CROSS JOIN date_bounds db
    LEFT JOIN product_sales ps
        ON i.Store_ID = ps.Store_ID
       AND i.Product_ID = ps.Product_ID
),

inventory_metrics AS (
    SELECT
        *,
        DATEDIFF(DAY, Active_Start_Date, Last_Sales_Date) + 1 AS Active_Days,

        DATEDIFF(DAY, Product_Active_Start_Date, Last_Sales_Date) + 1 AS Product_Active_Days,

        CAST(Stock_On_Hand * Product_Cost AS DECIMAL(12,2)) AS Inventory_Value,

        CAST(
            Total_Units_Sold * 1.0 
            / NULLIF(DATEDIFF(DAY, Product_Active_Start_Date, Last_Sales_Date) + 1, 0)
            AS DECIMAL(10,4)
        ) AS Avg_Daily_Sales,

        CAST(
            Total_Units_Sold * 1.0
            / NULLIF(Selling_Days, 0)
            AS DECIMAL(10,4)
        ) AS Avg_Sales_Per_Selling_Day

    FROM inventory_base
)

SELECT
    Store_ID,
    Store_Name,
    Store_City,
    Store_Location,
    Product_ID,
    Product_Name,
    Product_Category,
    Product_Cost,
    Product_Price,
    Stock_On_Hand,
    Total_Units_Sold,

    Active_Days,
    Product_Active_Days,
    Selling_Days,
    First_Sale_Date,
    Last_Product_Sale_Date,

    Inventory_Value,
    Avg_Daily_Sales,
    Avg_Sales_Per_Selling_Day,

    CASE 
        WHEN Avg_Daily_Sales > 0 
            THEN CAST(Stock_On_Hand * 1.0 / Avg_Daily_Sales AS DECIMAL(10,2))
        ELSE NULL
    END AS Days_Of_Inventory_Left,

    CASE
        WHEN Stock_On_Hand = 0 AND Avg_Daily_Sales > 0
            THEN 'Out of Stock'
        WHEN Total_Units_Sold = 0 AND Stock_On_Hand > 0
            THEN 'No Sales History'
        WHEN Avg_Daily_Sales > 0 
             AND Stock_On_Hand * 1.0 / Avg_Daily_Sales <= 7
            THEN 'High Stockout Risk'
        WHEN Avg_Daily_Sales > 0 
             AND Stock_On_Hand * 1.0 / Avg_Daily_Sales <= 30
            THEN 'Medium Stockout Risk'
        ELSE 'Healthy Stock'
    END AS Inventory_Risk

FROM inventory_metrics;
GO


SELECT TOP 20 *
FROM dbo.vw_inventory_risk;


SELECT COUNT(*) AS inventory_risk_rows
FROM dbo.vw_inventory_risk;

SELECT COUNT(*) AS inventory_rows
FROM dbo.inventory;