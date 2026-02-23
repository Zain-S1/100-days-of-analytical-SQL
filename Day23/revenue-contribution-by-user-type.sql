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



-- Source:
-- Kaggle Dataset — E-Commerce Behavior Data from Multi-Category Store
