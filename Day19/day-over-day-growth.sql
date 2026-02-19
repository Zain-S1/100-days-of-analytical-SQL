-- Day 19: Day-Over-Day Revenue Growth

-- Question:
-- What is the percentage change in revenue compared to the previous day?

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
