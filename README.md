# Retail Sales & Profitability Analysis

## 1. Project Overview

This project analyzes retail sales and profitability data to identify loss-making products, evaluate business performance, and highlight potential cost-related anomalies.

The analysis focuses on two key business questions:

- Which products and categories contribute most to revenue and profitability?
- Which products consistently generate losses, and where should the business prioritize further investigation?

**Tools:** SQL Server (T-SQL), Power BI, Excel, GitHub

**Dataset:** 1,190 sales line items, covering January–June 2015.

## 2. Business Objectives

- Evaluate overall sales and profit performance.
- Analyze monthly and product-category profitability.
- Identify products with the largest net losses.
- Detect products with recurring loss-making sales lines.
- Flag unusual cost patterns for further review.

## 3. Data Preparation & Analysis

SQL Server was used to perform data quality checks and profitability analysis.

The analysis included:

- Checking missing values and duplicate records.
- Validating sales, profit, and cost relationships.
- Calculating revenue, profit, and profit margin.
- Identifying loss-making sales lines and products.
- Classifying potentially abnormal cost patterns.

Four SQL scripts document the analytical workflow in the `sql` directory.

## 4. Key Findings

### Overall Business Performance

| Metric | Value |
|---|---:|
| Total Sales | 1,206,416.16 |
| Net Profit | 109,103.62 |
| Profit Margin | 9.04% |
| Total Sales Lines | 1,190 |
| Loss-Making Lines | 599 |
| Loss Rate | 50.34% |

Despite positive overall profitability, more than half of the sales lines recorded negative profit.

### Monthly Performance

January recorded a net loss of approximately 30,651, while May achieved the highest monthly profit of approximately 48,093.

This indicates substantial variation in profitability across the six-month period.

### Product-Level Losses

The analysis identified products with substantial net losses, including:

- Product `5165`: approximately -14,206 net profit.
- Polycom ViewStation ISDN Videoconferencing Unit: approximately -13,481 net profit.

Several other products showed recurring losses across multiple sales lines.

### Cost Anomalies

Two groups of sales lines were flagged for further investigation:

| Cost Risk Group | Sales Lines | Net Profit |
|---|---:|---:|
| High Cost - Critical | 114 | -78,492.44 |
| Cost Exceeds Sales | 485 | -115,383.12 |

Additionally, 25 sales lines had negative recorded costs. Their underlying business meaning could not be verified using the available dataset.

These findings identify potential areas for review rather than confirmed accounting errors.

## 5. Business Recommendations

**1. Prioritize high-impact loss-making products**

Review products generating the largest net losses to understand their pricing, cost structure, and transaction characteristics.

**2. Monitor recurring loss-making products**

Establish a recurring profitability review to identify products with consistently negative sales-line profitability.

**3. Investigate cost anomalies**

Prioritize records where reported costs substantially exceed sales, and validate negative cost entries against source-system definitions and supporting records.

**4. Improve profitability monitoring**

Use Power BI dashboards to monitor revenue, profit margin, and loss-making sales lines across product categories and periods.

## 6. Power BI Dashboard

### Sales Overview
![Sales Overview](image/Screenshot%202026-11-04%20000559.png)

### Product Profitability
![Product Profitability](image/Screenshot%202026-11-04%20000716.png)
## 7. Project Structure

```text
retail-sales-profitability-analysis/
├── README.md
├── sql/
│   ├── 01_Data_Quality.sql
│   ├── 02_Sales_Profitability.sql
│   ├── 03_Loss_Analysis.sql
│   └── 04_Cost_Anomalies.sql
└── images/
    ├── sales_overview.png
    └── product_profitability.png
```

## 8. Limitations

- The dataset covers only six months in 2015.
- The definition and accounting treatment of the `Cost` field have not been independently verified.
- Unusual cost values cannot be classified as errors without additional business documentation.
- The analysis identifies patterns and priorities for investigation but does not establish causal relationships.

## 9. Conclusion

This project demonstrates an end-to-end analytical workflow, from data quality assessment and SQL-based analysis to Power BI reporting and actionable business recommendations.

The key outcome is a structured approach to identifying and prioritizing profitability risks at the product and sales-line levels.
