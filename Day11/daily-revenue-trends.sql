-- Day 11: Daily Revenue Trend Analysis

-- Question:
-- What is the total revenue generated per day?

-- Solution
SELECT
    `Order Date` AS order_date
    ROUND(
        SUM(list_price * quantity * (1 - discount / 100.0)),
        2
    ) AS total_revenue
FROM retail_orders
GROUP BY `Order Date`
ORDER BY `Order Date` DESC;

-- Source:
-- Kaggle Dataset — Retail Order
