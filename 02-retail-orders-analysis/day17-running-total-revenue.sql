-- Day 17: Running Total Revenue

-- Question:
-- What is the cumulative revenue over time?

-- Solution
WITH daily_revenue AS (
    SELECT
        order_date,
        SUM(
            list_price * quantity * (1 - discount / 100.0)
        ) AS daily_revenue
    FROM retail_orders
    GROUP BY order_date
)
SELECT
    order_date,
    daily_revenue,
    SUM(daily_revenue)
        OVER (
            ORDER BY order_date
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS cumulative_revenue
FROM daily_revenue
ORDER BY order_date;

-- Source:
-- Kaggle Dataset — Retail Orders
