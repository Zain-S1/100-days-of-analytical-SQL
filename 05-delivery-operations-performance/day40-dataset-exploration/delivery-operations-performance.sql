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
FROM deliveries;

--------------------------------------------------
-- 2. On-Time Delivery Rate
--------------------------------------------------
SELECT
    SUM(CASE
        WHEN delivery_time_hours <= expected_time_hours
        THEN 1 ELSE 0
    END) * 1.0 / COUNT(*) AS on_time_delivery_rate
FROM deliveries;

--------------------------------------------------
-- 3. Average Delivery Time
--------------------------------------------------
SELECT
    AVG(delivery_time_hours) AS avg_delivery_time
FROM deliveries;

--------------------------------------------------
-- 4. Average Delivery Cost
--------------------------------------------------
SELECT
    AVG(delivery_cost) AS avg_delivery_cost
FROM deliveries;

--------------------------------------------------
-- 5. Average Customer Rating
--------------------------------------------------
SELECT
    AVG(delivery_rating) AS avg_delivery_rating
FROM deliveries;

--------------------------------------------------
-- 6. Delay Rate by Delivery Mode
--------------------------------------------------
SELECT
    delivery_mode,
    SUM(CASE
        WHEN delivery_time_hours > expected_time_hours
        THEN 1 ELSE 0
    END) * 1.0 / COUNT(*) AS delay_rate
FROM deliveries
GROUP BY delivery_mode
ORDER BY delay_rate DESC;

--------------------------------------------------
