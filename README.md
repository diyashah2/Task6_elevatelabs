# MySQL E-commerce Sales Analysis
-  This project performs exploratory data analysis (EDA) on a simulated e-commerce orderss table using MySQL. The goal is to understand sales performance, time-based trends, and product-level revenue.

-  Dataset Overview
    -  Table: orderss
    -  Columns: order_id, order_date, amount, product_id
    -  Sample Size: 15 records (2023 data)

-  Key SQL Analyses
  -  Monthly Breakdown:
      -  Extracted month and year using EXTRACT() and DATE_FORMAT()
      -  Counted orders per month
      -  Summed revenue per month
  -  Rolling 3-Month Revenue:
      -  Used DATE_SUB() to simulate moving window analysis
  -  Revenue Metrics:
      -  SUM(amount) for total revenue
      -  AVG, MIN, MAX for order value analysis
      -  COUNT(DISTINCT order_id) for order volume
  -  Product-Level Insights:
      -  Grouped by product_id
      -  Ranked by total revenue using ORDER BY
  -  Filtered Queries:
      -  Limited results by time range (e.g., H1 2023)
-  Purpose
  -  Learn how to group, aggregate, and analyze sales trends over time using core SQL functions in MySQL Workbench.
