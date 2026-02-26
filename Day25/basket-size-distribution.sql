-- Day 25: asket Size Distribution

-- Question:
-- How are purchasing sessions distributed by
-- number of products bought?

-- Solution
SELECT
    products_in_session,
    COUNT(*) AS number_of_sessions,
    COUNT(*) * 1.0 /
        SUM(COUNT(*)) OVER () AS session_share
FROM (
    SELECT
        user_session,
        COUNT(*) AS products_in_session
    FROM ecommerce_events
    WHERE event_type = 'purchase'
    GROUP BY user_session
) t
GROUP BY products_in_session
ORDER BY products_in_session;

-- Source:
-- Kaggle Dataset — E-Commerce Behavior Data from Multi-Category Store
