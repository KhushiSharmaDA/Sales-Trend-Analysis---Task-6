# Sales Trend Analysis Using SQL

## Task Overview

This task focuses on analyzing **monthly sales trends** using SQL aggregation functions. The goal is to understand how revenue and order volume change over time by grouping order data on a monthly basis.

## Objective

* Analyze **monthly revenue**
* Analyze **monthly order volume**
* Practice grouping, aggregation, and sorting in SQL

## Tools Used

* SQL (PostgreSQL / MySQL / SQLite compatible)

## Dataset Description

Table name: `orders`

| Column Name | Data Type | Description                      |
| ----------- | --------- | -------------------------------- |
| order_id    | INT       | Unique identifier for each order |
| order_date  | DATE      | Date when the order was placed   |
| amount      | DECIMAL   | Revenue generated from the order |
| product_id  | INT       | Identifier for the product       |

A small sample dataset was created to demonstrate aggregation logic clearly.

## Approach

1. Extracted **year** and **month** from `order_date` using the `EXTRACT()` function.
2. Grouped data by **year and month** to avoid mixing data from different years.
3. Calculated total monthly revenue using `SUM(amount)`.
4. Calculated monthly order volume using `COUNT(DISTINCT order_id)`.
5. Sorted results chronologically using `ORDER BY`.

## SQL Query

```sql
SELECT
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS total_orders
FROM orders
GROUP BY
  EXTRACT(YEAR FROM order_date),
  EXTRACT(MONTH FROM order_date)
ORDER BY
  year, month;
```

## Output

The query returns a results table with the following columns:

* `year`
* `month`
* `total_revenue`
* `total_orders`

Each row represents aggregated sales performance for a specific month.

## Key Learnings

* How to perform **time-based grouping** in SQL
* Importance of grouping by both **year and month**
* Use of aggregation functions like `SUM()` and `COUNT(DISTINCT)`
* Generating trend-ready, chronological result sets

## Status

✅ Task completed with executable SQL script and result table
