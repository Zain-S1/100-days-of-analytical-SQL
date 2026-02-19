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
    LAG(daily_revenue)
        OVER (
            ORDER BY order_date
        ) previous_day_revenue,
    (
        (daily_revenue - LAG(daily_revenue) OVER (ORDER BY order_date))
        /
        LAG(daily_revenue) OVER (ORDER BY order_date)
    ) * 100 AS day_over_day_growth_pct
FROM daily_revenue
ORDER BY order_date;

-- Source:
-- Kaggle Dataset — Retail Orders
