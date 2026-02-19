-- Day 18: Rolling 7-Day Average Revenue

-- Question:
-- What is the 7-day moving average of daily revenue?

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
    AVG(daily_revenue)
        OVER (
            ORDER BY order_date
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS cumulative_revenue
FROM daily_revenue
ORDER BY order_date;

-- Source:
-- Kaggle Dataset — Retail Orders
