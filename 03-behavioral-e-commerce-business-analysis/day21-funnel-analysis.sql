-- Day 21: Funnel Analysis (View → Cart → Purchase)

-- Question:
-- How efficiently do user sessions progress 
-- from viewing products to completing a purchase?

-- Solution
WITH session_steps AS (
    SELECT
        user_session,
        MAX(CASE WHEN event_type = 'view' THEN 1 ELSE 0) AS viewed,
        MAX(CASE WHEN event_type = 'cart' THEN 1 ELSE 0) AS added_to_cart,
        MAX(CASE WHEN event_type = 'purchase' THEN 1 ELSE 0) AS purchased
    FROM ecommerce_events
    GROUP BY user_session
)

SELECT
    COUNT(*) AS total_sessions,
    SUM(viewed) AS view_sessions,
    SUM(added_to_cart) AS cart_sessions,
    SUM(purchased) AS purchase_sessions,
    SUM(added_to_cart) * 1.0 / SUM(viewed) AS view_to_cart_rate,
    SUM(purchased) * 1.0 / SUM(added_to_cart) AS cart_to_purchase_rate,
    SUM(purchased) * 1.0 / COUNT(*) AS overall_conversion_rate
FROM session_steps;

-- Source:
-- Kaggle Dataset — E-Commerce Behavior Data from Multi-Category Store
