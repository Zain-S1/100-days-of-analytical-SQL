-- Day 23: Revenue Contribution by User Type

-- Question:
-- What percentage of total revenue comes from repeat buyers
-- compared to one-time buyers?

-- Solution
WITH user_purchase_counts AS (
    SELECT
        user_id,
        COUNT(*) AS purchase_count
    FROM ecommerce_events
    WHERE event_type = 'purchase'
    GROUP BY user_id
),

user_type AS (
    SELECT
    user_id,
        CASE
            WHEN purchase_count > 1 THEN 'Repeat Buyer'
            ELSE 'One-Time Buyer'
        END AS buyer_type
    FROM user_purchase_counts
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
