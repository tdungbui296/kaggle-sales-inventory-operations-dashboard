USE ToySalesPortfolio;
GO


SELECT 'sales' AS table_name, COUNT(*) AS total_rows FROM dbo.sales
UNION ALL
SELECT 'products', COUNT(*) FROM dbo.products
UNION ALL
SELECT 'stores', COUNT(*) FROM dbo.stores
UNION ALL
SELECT 'inventory', COUNT(*) FROM dbo.inventory;



SELECT 
    TABLE_NAME, 
    COLUMN_NAME, 
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME IN ('sales', 'products', 'stores', 'inventory')
ORDER BY TABLE_NAME, ORDINAL_POSITION;



SELECT COUNT(*) AS missing_product_id
FROM dbo.sales
WHERE Product_ID IS NULL;

SELECT COUNT(*) AS missing_store_id
FROM dbo.sales
WHERE Store_ID IS NULL;




SELECT 
    Store_ID,
    Product_ID,
    COUNT(*) AS duplicate_count
FROM dbo.inventory
GROUP BY Store_ID, Product_ID
HAVING COUNT(*) > 1;



SELECT 
    s.Product_ID,
    COUNT(*) AS sales_rows
FROM dbo.sales s
LEFT JOIN dbo.products p
    ON s.Product_ID = p.Product_ID
WHERE p.Product_ID IS NULL
GROUP BY s.Product_ID;




SELECT 
    s.Store_ID,
    COUNT(*) AS sales_rows
FROM dbo.sales s
LEFT JOIN dbo.stores st
    ON s.Store_ID = st.Store_ID
WHERE st.Store_ID IS NULL
GROUP BY s.Store_ID;



SELECT 
    Sale_ID,
    COUNT(*) AS duplicate_count
FROM dbo.sales
GROUP BY Sale_ID
HAVING COUNT(*) > 1;


SELECT 
    Product_ID,
    COUNT(*) AS duplicate_count
FROM dbo.products
GROUP BY Product_ID
HAVING COUNT(*) > 1;


SELECT 
    Store_ID,
    COUNT(*) AS duplicate_count
FROM dbo.stores
GROUP BY Store_ID
HAVING COUNT(*) > 1;




SELECT *
FROM dbo.sales
WHERE Units IS NULL
   OR Units <= 0;



SELECT *
FROM dbo.products
WHERE Product_Cost IS NULL
   OR Product_Price IS NULL
   OR Product_Cost < 0
   OR Product_Price <= 0;


SELECT
    Product_ID,
    Product_Name,
    Product_Category,
    Product_Cost,
    Product_Price
FROM dbo.products
WHERE Product_Price < Product_Cost;




SELECT *
FROM dbo.products
WHERE Product_Name IS NULL
   OR Product_Category IS NULL;

SELECT *
FROM dbo.stores
WHERE Store_Name IS NULL
   OR Store_City IS NULL
   OR Store_Location IS NULL;




SELECT
    MIN([Date]) AS first_sales_date,
    MAX([Date]) AS last_sales_date
FROM dbo.sales;

SELECT
    YEAR([Date]) AS sales_year,
    MONTH([Date]) AS sales_month,
    COUNT(*) AS transaction_count
FROM dbo.sales
GROUP BY YEAR([Date]), MONTH([Date])
ORDER BY sales_year, sales_month;




SELECT TOP 20
    s.Sale_ID,
    s.[Date] AS sale_date,
    s.Store_ID,
    st.Store_Name,
    st.Store_Open_Date
FROM dbo.sales s
JOIN dbo.stores st
    ON s.Store_ID = st.Store_ID
WHERE s.[Date] < st.Store_Open_Date
ORDER BY s.[Date];




SELECT *
FROM dbo.inventory
WHERE Stock_On_Hand IS NULL;



SELECT 
    i.Product_ID,
    COUNT(*) AS inventory_rows
FROM dbo.inventory i
LEFT JOIN dbo.products p
    ON i.Product_ID = p.Product_ID
WHERE p.Product_ID IS NULL
GROUP BY i.Product_ID;


SELECT 
    i.Store_ID,
    COUNT(*) AS inventory_rows
FROM dbo.inventory i
LEFT JOIN dbo.stores st
    ON i.Store_ID = st.Store_ID
WHERE st.Store_ID IS NULL
GROUP BY i.Store_ID;



WITH missing_sales AS (
    SELECT
        s.Store_ID,
        s.Product_ID,
        s.Sale_ID,
        s.Units
    FROM dbo.sales s
    LEFT JOIN dbo.inventory i
        ON s.Store_ID = i.Store_ID
       AND s.Product_ID = i.Product_ID
    WHERE i.Store_ID IS NULL
)

SELECT
    ms.Product_ID,
    p.Product_Name,
    p.Product_Category,
    COUNT(DISTINCT CONCAT(ms.Store_ID, '-', ms.Product_ID)) AS missing_store_product_pairs,
    COUNT(*) AS sales_rows,
    SUM(ms.Units) AS units_sold
FROM missing_sales ms
JOIN dbo.products p
    ON ms.Product_ID = p.Product_ID
GROUP BY
    ms.Product_ID,
    p.Product_Name,
    p.Product_Category
ORDER BY units_sold DESC;



SELECT
    s.Product_ID,
    p.Product_Name,
    MIN(s.[Date]) AS first_sale_date,
    MAX(s.[Date]) AS last_sale_date,
    COUNT(*) AS sales_rows,
    SUM(s.Units) AS units_sold
FROM dbo.sales s
LEFT JOIN dbo.inventory i
    ON s.Store_ID = i.Store_ID
   AND s.Product_ID = i.Product_ID
JOIN dbo.products p
    ON s.Product_ID = p.Product_ID
WHERE i.Store_ID IS NULL
GROUP BY
    s.Product_ID,
    p.Product_Name
ORDER BY last_sale_date DESC;