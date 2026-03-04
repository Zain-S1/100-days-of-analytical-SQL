-- Day 26: Churn by Signup Cohort

-- Question:
-- How does churn vary across signup cohorts?

-- Solution
WITH session_metrics AS (
    SELECT
        user_session,
        COUNT(*) AS products_in_session,
        SUM(price) AS session_revenue
    FROM ecommerce_events
    WHERE event_type = 'purchase'
    GROUP BY user_session
)

SELECT
    products_in_session,
    COUNT(*) AS number_of_sessions,
    SUM(session_revenue) AS total_revenue,
    SUM(session_revenue) * 1.0 /
        SUM(SUM(session_revenue)) OVER () AS revenue_share
FROM session_metrics
GROUP BY products_in_session
ORDER BY products_in_session;

-- Source:
-- Kaggle Dataset — E-Commerce Behavior Data from Multi-Category Store
