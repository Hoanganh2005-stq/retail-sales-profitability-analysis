
-- 02. SALES & PROFITABILITY ANALYSIS

-- 1. Overall performance
SELECT
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(
        100.0 * SUM(Profit)
        / NULLIF(SUM(Sales), 0), 2
    ) AS Profit_Margin_Pct
FROM dbo.retail_sales_raw;


-- 2. Monthly performance
SELECT
    YEAR(Order_Date) AS Sales_Year,
    MONTH(Order_Date) AS Sales_Month,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(
        100.0 * SUM(Profit)
        / NULLIF(SUM(Sales), 0), 2
    ) AS Profit_Margin_Pct
FROM dbo.retail_sales_raw
GROUP BY
    YEAR(Order_Date),
    MONTH(Order_Date)
ORDER BY
    Sales_Year,
    Sales_Month;


-- 3. Product category performance
SELECT
    Product_Category,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(
        100.0 * SUM(Profit)
        / NULLIF(SUM(Sales), 0), 2
    ) AS Profit_Margin_Pct
FROM dbo.retail_sales_raw
GROUP BY Product_Category
ORDER BY Total_Sales DESC;
