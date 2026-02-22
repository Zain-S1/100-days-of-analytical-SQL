-- Day 21: Funnel Analysis (View → Cart → Purchase)

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
),  
revenue_with_lag AS (
    SELECT
        order_date,
        daily_revenue,
        LAG(daily_revenue)
            OVER (
                ORDER BY order_date
            ) AS previous_day_revenue
    FROM daily_revenue
)
    
SELECT
    order_date,
    daily_revenue,
    previous_day_revenue,
    (
        (daily_revenue - previous_day_revenue)
        / previous_day_revenue
    ) * 100 AS day_over_day_growth_pct
FROM revenue_with_lag
ORDER BY order_date;

-- Source:
-- Kaggle Dataset — Behavioral E-Commerce Data
