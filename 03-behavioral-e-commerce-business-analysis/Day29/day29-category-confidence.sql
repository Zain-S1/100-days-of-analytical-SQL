-- Day 29: Main Category Pair Confidence

-- Question:
-- What is the confidence of category A leading to category B?

-- Solution
WITH session_main_categories AS (
    SELECT DISTINCT
        user_session,
        SUBSTRING_INDEX(category_code, '.', 1) AS main_category
    FROM ecommerce_events
    WHERE event_type = 'purchase'
      AND category_code IS NOT NULL
),

category_counts AS (
    SELECT
        main_category,
        COUNT(DISTINCT user_session) AS category_session_count
    FROM session_main_categories
    GROUP BY main_category
),

category_pairs AS (
    SELECT
        a.main_category AS category_1,
        b.main_category AS category_2,
        COUNT(*) AS pair_frequency
    FROM session_main_categories a
    JOIN session_main_categories b
        ON a.user_session = b.user_session
       AND a.main_category < b.main_category
    GROUP BY a.main_category, b.main_category
)

SELECT
    cp.category_1,
    cp.category_2,
    cp.pair_frequency,
    cp.pair_frequency * 1.0 / c1.category_session_count AS confidence_1_to_2,
    cp.pair_frequency * 1.0 / c2.category_session_count AS confidence_2_to_1
FROM category_pairs cp
JOIN category_counts c1
    ON cp.category_1 = c1.main_category
JOIN category_counts c2
    ON cp.category_2 = c2.main_category
ORDER BY confidence_1_to_2 DESC;

-- Source:
-- Kaggle Dataset — E-Commerce Behavior Data from Multi-Category Store
