USE ToySalesPortfolio;
GO
SELECT
    Inventory_Risk,
    COUNT(*) AS Product_Store_Count,
    SUM(Stock_On_Hand) AS Total_Stock_On_Hand,
    SUM(Inventory_Value) AS Inventory_Value,
    CAST(AVG(Avg_Daily_Sales) AS DECIMAL(10,4)) AS Avg_Daily_Sales,
    CAST(AVG(Days_Of_Inventory_Left) AS DECIMAL(10,2)) AS Avg_Days_Of_Inventory_Left
FROM dbo.vw_inventory_risk
GROUP BY Inventory_Risk
ORDER BY Product_Store_Count DESC;


SELECT
    Store_ID,
    Store_Name,
    Store_City,
    Store_Location,
    Product_ID,
    Product_Name,
    Product_Category,
    Stock_On_Hand,
    Total_Units_Sold,
    Avg_Daily_Sales,
    Days_Of_Inventory_Left,
    Inventory_Value,
    Inventory_Risk
FROM dbo.vw_inventory_risk
WHERE Inventory_Risk IN ('Out of Stock', 'High Stockout Risk')
ORDER BY 
    CASE 
        WHEN Inventory_Risk = 'Out of Stock' THEN 1
        WHEN Inventory_Risk = 'High Stockout Risk' THEN 2
        ELSE 3
    END,
    Days_Of_Inventory_Left ASC;


    SELECT
    Store_ID,
    Store_Name,
    Store_City,
    Store_Location,
    Product_ID,
    Product_Name,
    Product_Category,
    Stock_On_Hand,
    Inventory_Value,
    Total_Units_Sold,
    Inventory_Risk
FROM dbo.vw_inventory_risk
WHERE Inventory_Risk = 'No Sales History'
ORDER BY Inventory_Value DESC;


SELECT
    Product_Category,
    COUNT(*) AS Product_Store_Count,
    SUM(Stock_On_Hand) AS Total_Stock_On_Hand,
    SUM(Inventory_Value) AS Inventory_Value,
    SUM(Total_Units_Sold) AS Historical_Units_Sold
FROM dbo.vw_inventory_risk
GROUP BY Product_Category
ORDER BY Inventory_Value DESC;


SELECT
    Store_Location,
    Inventory_Risk,
    COUNT(*) AS Product_Store_Count,
    SUM(Inventory_Value) AS Inventory_Value,
    SUM(Stock_On_Hand) AS Total_Stock_On_Hand
FROM dbo.vw_inventory_risk
GROUP BY Store_Location, Inventory_Risk
ORDER BY Store_Location, Product_Store_Count DESC;