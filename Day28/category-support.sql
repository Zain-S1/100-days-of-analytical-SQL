-- Day 28: Main Category Pair Support

-- Question:
-- What is the support of each main-category pair?
-- (i.e., proportion of purchasing sessions containing both categories)

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
),

total_sessions AS (
    SELECT COUNT(DISTINCT user_session) AS total_purchasing_sessions
    FROM FROM ecommerce_events
    WHERE event_type = 'purchase'
)

SELECT
    cp.category_1,
    cp.category_2,
    COUNT(*) AS pair_frequency,
    COUNT(*) * 1.0 / ts.total_purchasing_sessions AS support
FROM category_pairs cp
CROSS JOIN total_sessions ts
GROUP BY cp.category_1, cp.category_2, ts.total_purchasing_sessions
ORDER BY support DESC;

-- Source:
-- Kaggle Dataset — E-Commerce Behavior Data from Multi-Category Store
