-- Day 27: Category-Level Co-Purchase Analysis

-- Question:
-- Which product categories are most frequently
-- purchased together within the same session?

-- Solution
WITH session_categories AS (
    SELECT DISTINCT
        user_session,
        category_code
    FROM ecommerce_events
    WHERE event_type = 'purchase'
      AND category_code IS NOT NULL
),

category_pairs AS (
    SELECT
        a.category_code AS category_1,
        b.category_code AS category_2,
        a.user_session
    FROM session_categories a
    JOIN session_categories b
        ON a.user_session = b.user_session
       AND a.category_code < b.category_code
)

SELECT
    category_1,
    category_2,
    COUNT(*) AS times_purchased_together
FROM category_pairs
GROUP BY category_1, category_2
ORDER BY times_purchased_together DESC
LIMIT 10;

-- Source:
-- Kaggle Dataset — E-Commerce Behavior Data from Multi-Category Store
