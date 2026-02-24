-- Day 24: Session-Level Repeat Purchase Behavior

-- Question:
-- How many sessions include multiple purchases,
-- and how much revenue do they generate?

-- Solution
WITH session_purchase_counts AS (
    SELECT
        user_session,
        COUNT(*) AS purchase_count,
        SUM(price) AS session_revenue
    FROM ecommerce_events
    WHERE event_type = 'purchase'
    GROUP BY user_session
),

session_type AS (
    SELECT
    user_session,
    purchase_count,
    session_revenue,
        CASE
            WHEN purchase_count > 1 THEN 'Multi-Purchase Session'
            ELSE 'Single-Purchase Session'
        END AS session_type
    FROM session_purchase_counts
),

purchase_revenue AS (
    SELECT
        user_id,
        SUM(price) AS total_user_revenue
    FROM ecommerce_events
    WHERE event_type = 'purchase'
    GROUP BY user_id
)

SELECT
    ut.buyer_type,
    SUM(pr.total_user_revenue) AS revenue,
    SUM(pr.total_user_revenue) + 1.0
    / ( SELECT SUM(price)
        FROM ecommerce_events
        WHERE event_type = 'purchase' ) AS revenue_share
FROM user_type ut
JOIN purchase_revenue pr
    ON ut.user_id = pr.user_id
GROUP BY ut.buyer_type;

-- Source:
-- Kaggle Dataset — E-Commerce Behavior Data from Multi-Category Store

------------------
-- Results:
------------------

-- * Revenue Share by One-Time Buyers: 25%
-- * Revenue Share by Repeat Buyers: 75%
