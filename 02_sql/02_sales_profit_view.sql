USE ToySalesPortfolio;
GO

CREATE OR ALTER VIEW dbo.vw_sales_profit AS
SELECT
    s.Sale_ID,
    s.[Date],
    s.Store_ID,
    st.Store_Name,
    st.Store_City,
    st.Store_Location,
    s.Product_ID,
    p.Product_Name,
    p.Product_Category,
    s.Units,
    p.Product_Cost,
    p.Product_Price,
    s.Units * p.Product_Price AS Revenue,
    s.Units * p.Product_Cost AS Cost,
    s.Units * (p.Product_Price - p.Product_Cost) AS Profit
FROM dbo.sales s
JOIN dbo.products p
    ON s.Product_ID = p.Product_ID
JOIN dbo.stores st
    ON s.Store_ID = st.Store_ID;
GO