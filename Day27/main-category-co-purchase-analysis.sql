-- Day 27: Main Category Co-Purchase Analysis

-- Question:
-- Which main product categories are most frequently
-- purchased together within the same session?

-- Solution
WITH session_main_categories AS (
    SELECT DISTINCT
        user_session,
        SUBSTRING_INDEX(category_code, '.', 1) AS main_category
    FROM ecommerce_events
    WHERE event_type = 'purchase'
      AND category_code IS NOT NULL
),

category_pairs AS (
    SELECT
        a.main_category AS category_1,
        b.main_category AS category_2,
        a.user_session
    FROM session_main_categories a
    JOIN session_main_categories b
        ON a.user_session = b.user_session
       AND a.main_category < b.main_category
)

SELECT
    category_1,
    category_2,
    COUNT(*) AS times_purchased_together
FROM category_pairs
GROUP BY category_1, category_2
ORDER BY times_purchased_together DESC;

-- Source:
-- Kaggle Dataset — E-Commerce Behavior Data from Multi-Category Store
