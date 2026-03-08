-- Day 22: Repeat Purchase Behavior

-- Question:
-- How many users made more than one purchase?

-- Solution
WITH october_purchase AS (
    SELECT *
    FROM ecommerce_events
    WHERE event_type = 'purchase'
),

user_purchase_count AS (
    SELECT 
        user_id,
        COUNT(*) AS purchase_count
    FROM october_purchase
    GROUP BY user_id
)

SELECT 
    COUNT(*) AS repeat_users
FROM user_purchase_count
WHERE purchase_count > 1;

-- Source:
-- Kaggle Dataset — E-Commerce Behavior Data from Multi-Category Store
