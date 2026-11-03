
-- 01. DATA QUALITY CHECKS
-- Retail Sales & Profitability Analysis

-- Check total records and key data issues
SELECT
    COUNT(*) AS Total_Rows,
    SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END)
        AS Null_Sales,
    SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END)
        AS Null_Profit,
    SUM(CASE WHEN Sales < 0 THEN 1 ELSE 0 END)
        AS Negative_Sales,
    SUM(CASE WHEN Cost < 0 THEN 1 ELSE 0 END)
        AS Negative_Cost,
    SUM(CASE WHEN Profit < 0 THEN 1 ELSE 0 END)
        AS Negative_Profit
FROM dbo.retail_sales_raw;
