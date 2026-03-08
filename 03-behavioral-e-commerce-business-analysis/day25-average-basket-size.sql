-- Day 25: Average Basket Size

-- Question:
-- What is the average number of products purchased
-- per purchasing session?

-- Solution
WITH session_product_counts AS (
    SELECT
        user_session,
        COUNT(*) AS products_in_session
    FROM ecommerce_events
    WHERE event_type = 'purchase'
    GROUP BY user_session
)

SELECT
    AVG(products_in_session) AS average_basket_size
FROM session_product_counts;

-- Source:
-- Kaggle Dataset — E-Commerce Behavior Data from Multi-Category Store
