# sales_analysis.sql
# 🛒 Superstore Sales Analysis — SQL Project

![SQL](https://img.shields.io/badge/SQL-MySQL-blue?style=flat-square&logo=mysql)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=flat-square)
![Dataset](https://img.shields.io/badge/Records-500%2B-orange?style=flat-square)
![License](https://img.shields.io/badge/License-MIT-lightgrey?style=flat-square)

> **End-to-end SQL analysis of a Superstore dataset — transforming raw sales data into real business insights using core and advanced SQL concepts.**

---

## 📌 Project Overview

This project demonstrates how SQL can be used to answer real business questions from a retail superstore dataset covering **500+ transactions** across Jan 2023 – May 2024.

Instead of just writing queries, each query is mapped to a **business problem** — the way a Data Analyst thinks on the job.

---

## 🎯 Business Questions Answered

| # | Business Question | SQL Concept Used |
|---|---|---|
| 1 | Which region generates the highest sales? | `GROUP BY`, `SUM`, `ORDER BY` |
| 2 | Which category has the best profit margin? | `Aggregate Functions`, `ROUND` |
| 3 | How do discounts impact profitability? | `CASE WHEN`, `AVG`, `GROUP BY` |
| 4 | What is the monthly sales trend? | `YEAR()`, `MONTH()`, `DATE functions` |
| 5 | Who are the top customers by profit? | `COUNT`, `SUM`, `ORDER BY`, `LIMIT` |
| 6 | Which sub-categories generate losses? | `HAVING`, `CASE WHEN`, conditional aggregation |
| 7 | Which shipping mode is most efficient? | `Subquery`, `DATEDIFF`, `AVG` |
| 8 | What are the key business insights? | All of the above combined |

---

## 🗂️ Dataset

| Column | Description |
|---|---|
| `order_id` | Unique order identifier |
| `order_date` | Date of order |
| `ship_date` | Date of shipment |
| `ship_mode` | Shipping method (First Class, Same Day, etc.) |
| `customer_name` | Customer name |
| `segment` | Business segment (Consumer / Corporate / Home Office) |
| `region` | Geographic region (East / West / Central / South) |
| `category` | Product category (Furniture / Technology / Office Supplies) |
| `sub_category` | Product sub-category |
| `sales` | Revenue from the order |
| `quantity` | Number of units ordered |
| `discount` | Discount percentage applied |
| `profit` | Profit from the order |

---

## 💡 Key Insights

**1. Technology sells the most — but Office Supplies earns the most**
Technology has the highest total sales (~$108K) but Office Supplies has a better profit margin (29.5% vs 22%). High revenue ≠ high profit.

**2. High discounts consistently reduce profit**
Orders with 21%+ discount have the lowest average profit. A discount cap policy is recommended for low-margin products.

**3. East region leads — but all four regions are competitive**
East generates the highest sales, but the gap with Central is only ~17%, suggesting consistent national demand.

**4. Q3 (July–September) is the strongest sales period**
Monthly trend shows a clear peak mid-year. February is the weakest month — an opportunity for targeted promotions.

**5. Tables and Binders have the highest rate of loss-making orders**
Root cause: high discounts on already thin margins. Recommendation: raise minimum price floor or limit discounts on these sub-categories.

---

## 🧠 SQL Concepts Demonstrated

```sql
-- Aggregate Functions
SELECT category, ROUND(SUM(sales), 2), ROUND(AVG(profit), 2)
FROM superstore_sales
GROUP BY category;

-- HAVING (filter after aggregation)
SELECT sub_category, COUNT(*) AS loss_orders
FROM superstore_sales
WHERE profit < 0
GROUP BY sub_category
HAVING COUNT(*) > 5
ORDER BY loss_orders DESC;

-- CASE WHEN (discount buckets)
SELECT 
  CASE 
    WHEN discount = 0 THEN 'No Discount'
    WHEN discount <= 0.10 THEN 'Low (1-10%)'
    WHEN discount <= 0.20 THEN 'Medium (11-20%)'
    ELSE 'High (21%+)'
  END AS discount_bucket,
  ROUND(AVG(profit), 2) AS avg_profit
FROM superstore_sales
GROUP BY discount_bucket;

-- Monthly Trend using DATE functions
SELECT YEAR(order_date) AS yr, MONTH(order_date) AS mo,
       ROUND(SUM(sales), 2) AS monthly_sales
FROM superstore_sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY yr, mo;

-- Subquery for percentage calculation
SELECT ship_mode,
       ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM superstore_sales), 1) AS order_pct
FROM superstore_sales
GROUP BY ship_mode;
```

---

## 📊 Results Summary

| Metric | Value |
|---|---|
| Total Records | 500+ |
| Total Sales (approx) | $270,000 |
| Total Profit (approx) | $61,000 |
| Overall Profit Margin | ~22.6% |
| Best Region (Sales) | East |
| Best Category (Margin) | Office Supplies (29.5%) |
| Weakest Month | February |
| Peak Season | July – September |

---

## 🛠️ Tools Used

- **MySQL 8.0** — for running all queries
- **MySQL Workbench** — for writing, testing, and screenshots
- **DB Fiddle** — for quick online testing

---

## 📁 Project Structure

```
superstore-sql-analysis/
│
├── README.md               ← You are here
├── data/
│   └── superstore_data.sql ← CREATE TABLE + INSERT statements
├── queries/
│   ├── 01_region_sales.sql
│   ├── 02_category_profit.sql
│   ├── 03_discount_impact.sql
│   ├── 04_monthly_trend.sql
│   ├── 05_top_customers.sql
│   ├── 06_loss_making.sql
│   └── 07_ship_mode.sql
└── insights/
    └── business_insights.md
```

---

## 🚀 How to Run

1. Open **MySQL Workbench** 
2. Select **MySQL 8.0**
3. Run `data/superstore_data.sql` to create and load the table
4. Run any query from the `queries/` folder
5. Analyze the results!

---

## 👤 Author

**Satyam Shukla**
Aspiring Data Analyst | SQL · Python · Data Visualization


---



---

> *"SQL is not just a technical skill — it is the language every Data Analyst must speak fluently."*
