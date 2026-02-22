-- Day 21: Funnel Analysis (View → Cart → Purchase)

-- Question:
-- How efficiently do user sessions progress 
-- from viewing products to completing a purchase?

-- Solution
WITH session_steps AS (
    SELECT
        user_session,
        (CASE WHEN 
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
-- Kaggle Dataset — E-Commerce Behavior Data from Multi-Category Store
