-- Day 13: First-Time vs Returning Customers

-- Question:
-- For each order, is the customer making their first purchase
-- or are they a returning customer?

-- Solution
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS order_month,
    ROUND(
        SUM(list_price * quantity * (1 - discount / 100.0)),
        2
    ) AS total_revenue
FROM retail_orders
GROUP BY order_month
ORDER BY order_month;

-- Source:
-- Kaggle Dataset — Retail Orders
