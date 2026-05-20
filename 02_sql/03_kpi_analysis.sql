USE ToySalesPortfolio;
SELECT COUNT(*) AS view_rows
FROM dbo.vw_sales_profit;
SELECT COUNT(*) AS sales_rows
FROM dbo.sales;


SELECT
    SUM(Revenue) AS Total_Revenue,
    SUM(Cost) AS Total_Cost,
    SUM(Profit) AS Total_Profit,
    CAST(SUM(Profit) * 100.0 / NULLIF(SUM(Revenue), 0) AS DECIMAL(6,2)) AS Profit_Margin_Pct,
    SUM(Units) AS Total_Units_Sold,
    COUNT(DISTINCT Sale_ID) AS Total_Transactions
FROM dbo.vw_sales_profit;


SELECT
    Product_Category,
    SUM(Units) AS Total_Units_Sold,
    SUM(Revenue) AS Revenue,
    SUM(Cost) AS Cost,
    SUM(Profit) AS Profit,
    CAST(SUM(Profit) * 100.0 / NULLIF(SUM(Revenue), 0) AS DECIMAL(6,2)) AS Profit_Margin_Pct
FROM dbo.vw_sales_profit
GROUP BY Product_Category
ORDER BY Profit DESC;

SELECT TOP 10
    Product_ID,
    Product_Name,
    Product_Category,
    SUM(Units) AS Total_Units_Sold,
    SUM(Revenue) AS Revenue,
    SUM(Cost) AS Cost,
    SUM(Profit) AS Profit,
    CAST(SUM(Profit) * 100.0 / NULLIF(SUM(Revenue), 0) AS DECIMAL(5,2)) AS Profit_Margin_Pct
FROM dbo.vw_sales_profit
GROUP BY
    Product_ID,
    Product_Name,
    Product_Category
ORDER BY Profit DESC;


SELECT
    Store_ID,
    Store_Name,
    Store_City,
    Store_Location,
    SUM(Units) AS Total_Units_Sold,
    SUM(Revenue) AS Revenue,
    SUM(Cost) AS Cost,
    SUM(Profit) AS Profit,
    CAST(SUM(Profit) * 100.0 / NULLIF(SUM(Revenue), 0) AS DECIMAL(5,2)) AS Profit_Margin_Pct
FROM dbo.vw_sales_profit
GROUP BY
    Store_ID,
    Store_Name,
    Store_City,
    Store_Location
ORDER BY Profit DESC;


SELECT
    Store_Location,
    COUNT(DISTINCT Store_ID) AS Number_Of_Stores,
    SUM(Units) AS Total_Units_Sold,
    SUM(Revenue) AS Revenue,
    SUM(Cost) AS Cost,
    SUM(Profit) AS Profit,
    CAST(SUM(Profit) * 100.0 / NULLIF(SUM(Revenue), 0) AS DECIMAL(5,2)) AS Profit_Margin_Pct
FROM dbo.vw_sales_profit
GROUP BY Store_Location
ORDER BY Profit DESC;


SELECT
    Store_Location,
    COUNT(DISTINCT Store_ID) AS Number_Of_Stores,
    SUM(Revenue) AS Total_Revenue,
    SUM(Profit) AS Total_Profit,
    CAST(SUM(Revenue) * 1.0 / COUNT(DISTINCT Store_ID) AS DECIMAL(12,2)) AS Avg_Revenue_Per_Store,
    CAST(SUM(Profit) * 1.0 / COUNT(DISTINCT Store_ID) AS DECIMAL(12,2)) AS Avg_Profit_Per_Store,
    CAST(SUM(Profit) * 100.0 / NULLIF(SUM(Revenue), 0) AS DECIMAL(5,2)) AS Profit_Margin_Pct
FROM dbo.vw_sales_profit
GROUP BY Store_Location
ORDER BY Avg_Profit_Per_Store DESC;



SELECT
    DATEFROMPARTS(YEAR([Date]), MONTH([Date]), 1) AS Month_Start,
    YEAR([Date]) AS Sales_Year,
    MONTH([Date]) AS Sales_Month,
    SUM(Units) AS Total_Units_Sold,
    SUM(Revenue) AS Revenue,
    SUM(Cost) AS Cost,
    SUM(Profit) AS Profit,
    CAST(SUM(Profit) * 100.0 / NULLIF(SUM(Revenue), 0) AS DECIMAL(5,2)) AS Profit_Margin_Pct
FROM dbo.vw_sales_profit
GROUP BY
    DATEFROMPARTS(YEAR([Date]), MONTH([Date]), 1),
    YEAR([Date]),
    MONTH([Date]);