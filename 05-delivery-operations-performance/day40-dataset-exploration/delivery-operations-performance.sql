-- Day 40: Kaggle Dataset Exploration — Delivery Operations Performance Summary
-- Dataset: Delivery Logistics Performance & Operations

-- Columns:

-- delivery_id, delivery_partner, package_type,
-- vehicle_type, delivery_mode, region,
-- weather_condition, distance_km,
-- package_weight_kg, delivery_time_hours,
-- expected_time_hours, delayed,
-- delivery_status, delivery_rating, delivery_cost

--------------------------------------------------
-- 1. Total Deliveries
--------------------------------------------------
SELECT
    COUNT(*) AS total_deliveries
FROM Delivery_Logistics;

--------------------------------------------------
-- 2. On-Time Delivery Rate
--------------------------------------------------
SELECT
    SUM(CASE WHEN delayed = 0 THEN 1 ELSE 0 END) * 1.0
    / COUNT(*) AS on_time_rate
FROM deliveries;

--------------------------------------------------
-- 3. Average Delivery Time
--------------------------------------------------
SELECT
    AVG(delivery_time_hours) AS avg_delivery_time
FROM deliveries;

--------------------------------------------------
-- 4. Average Customer Rating
--------------------------------------------------
SELECT
    AVG(delivery_rating) AS avg_delivery_rating
FROM deliveries;

--------------------------------------------------
-- 5. Top 5 Categories by Revenue
--------------------------------------------------
SELECT
    category_code,
    SUM(price) AS category_revenue
FROM ecommerce_events
WHERE event_type = 'purchase'
GROUP BY category_code
ORDER BY category_revenue DESC
LIMIT 5;

--------------------------------------------------
-- 6. Average Order Value (Session-Based)
--------------------------------------------------
WITH session_revenue AS (
    SELECT
        user_session,
        SUM(price) AS session_total
    FROM ecommerce_events
    WHERE event_type = 'purchase'
    GROUP BY user_session
)

SELECT
    AVG(session_total) AS average_order_value
FROM session_revenue;

--------------------------------------------------
