-- Day 46: Package Weight & Type Impact

-- Question:
-- How do package weight and type affect delivery performance?

-- Solution
--------------------------------------------------
-- 1️⃣ Performance by Package Type
--------------------------------------------------
SELECT
    CASE
        WHEN distance_km < 5 THEN '0-5 km'
        WHEN distance_km < 10 THEN '5-10 km'
        WHEN distance_km < 20 THEN '10-20 km'
        ELSE '20+ km'
    END AS distance_bucket,
    AVG(delivery_time_hours) AS avg_delivery_time,
    COUNT(*) AS deliveries
FROM deliveries
GROUP BY distance_bucket
ORDER BY avg_delivery_time;

--------------------------------------------------
-- 2️⃣ Performance by Weight Bucket
--------------------------------------------------
SELECT
    CASE
        WHEN distance_km < 5 THEN '0-5 km'
        WHEN distance_km < 10 THEN '5-10 km'
        WHEN distance_km < 20 THEN '10-20 km'
        ELSE '20+ km'
    END AS distance_bucket,
    SUM(CASE
        WHEN delivery_time_hours > expected_time_hours
        THEN 1 ELSE 0
    END) * 1.0 / COUNT(*) AS delay_rate
FROM deliveries
GROUP BY distance_bucket
ORDER BY delay_rate DESC;

-- Source:
-- Kaggle Dataset — Delivery Logistics Performance & Operations
