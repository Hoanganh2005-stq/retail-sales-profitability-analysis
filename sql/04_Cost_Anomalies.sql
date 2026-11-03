-- Phân loại chi phí bất thường
SELECT
    CASE
        WHEN Cost < 0 THEN 'Negative Cost'
        WHEN Sales > 0 AND Cost >= Sales * 3
            THEN 'High Cost - Critical'
        WHEN Cost > Sales
            THEN 'Cost Exceeds Sales'
        ELSE 'Normal'
    END AS Cost_Status,
    COUNT(*) AS Total_Lines,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Cost), 2) AS Total_Cost,
    ROUND(SUM(Profit), 2) AS Net_Profit
FROM dbo.retail_sales_raw
GROUP BY
    CASE
        WHEN Cost < 0 THEN 'Negative Cost'
        WHEN Sales > 0 AND Cost >= Sales * 3
            THEN 'High Cost - Critical'
        WHEN Cost > Sales
            THEN 'Cost Exceeds Sales'
        ELSE 'Normal'
    END
ORDER BY Net_Profit ASC;
