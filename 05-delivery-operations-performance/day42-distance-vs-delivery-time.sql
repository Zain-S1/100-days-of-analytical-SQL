-- Day 42: Distance vs Delivery Time

-- Question:
-- How does distance impact delivery time and delays?

-- Solution
--------------------------------------------------
-- 1️⃣ Average Delivery Time by Distance Bucket
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


-- Source:
-- Kaggle Dataset — Delivery Logistics Performance & Operations
