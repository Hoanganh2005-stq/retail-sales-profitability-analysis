
-- 03. LOSS ANALYSIS
-- 1. Overall loss performance

SELECT
    COUNT(*) AS Total_Lines,
    SUM(CASE WHEN Profit < 0 THEN 1 ELSE 0 END)
        AS Loss_Lines,
    ROUND(
        100.0 * SUM(CASE WHEN Profit < 0 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0), 2
    ) AS Loss_Rate_Pct,
    ROUND(
        SUM(CASE WHEN Profit < 0 THEN Profit ELSE 0 END), 2
    ) AS Total_Gross_Loss
FROM dbo.retail_sales_raw;


-- 2. Top 10 products by lowest net profit

SELECT TOP 10
    Product_Name,
    COUNT(*) AS Total_Lines,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Net_Profit
FROM dbo.retail_sales_raw
GROUP BY Product_Name
HAVING SUM(Profit) < 0
ORDER BY Net_Profit ASC;


-- 3. Products with recurring losses

SELECT
    Product_Name,
    COUNT(*) AS Total_Lines,
    SUM(CASE WHEN Profit < 0 THEN 1 ELSE 0 END)
        AS Loss_Lines,
    ROUND(
        100.0 * SUM(CASE WHEN Profit < 0 THEN 1 ELSE 0 END)
        / NULLIF(COUNT(*), 0), 2
    ) AS Loss_Rate_Pct,
    ROUND(SUM(Profit), 2) AS Net_Profit
FROM dbo.retail_sales_raw
GROUP BY Product_Name
HAVING COUNT(*) >= 3
   AND SUM(CASE WHEN Profit < 0 THEN 1 ELSE 0 END) >= 2
ORDER BY Loss_Lines DESC, Net_Profit ASC;
