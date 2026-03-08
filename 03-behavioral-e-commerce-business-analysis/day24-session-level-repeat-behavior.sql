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
)

SELECT
    session_type,
    COUNT(*) AS number_of_sessions,
    SUM(session_revenue) AS total_revenue,
    SUM(session_revenue) * 1.0 /
        (SELECT SUM(price)
         FROM ecommerce_events
         WHERE event_type = 'purchase') AS revenue_share
FROM session_classification
GROUP BY session_type;

-- Source:
-- Kaggle Dataset — E-Commerce Behavior Data from Multi-Category Store

------------------
-- Results:
------------------

-- * Revenue Share from Multi-Purchase Session: 
-- * Revenue Share from Single-Purchase Session: 
