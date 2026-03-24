-- Day 47: Drivers of Customer Satisfaction

-- Question:
-- What factors impact delivery ratings?

-- Solution
--------------------------------------------------
-- 1️⃣ Rating by Delay Status
--------------------------------------------------
SELECT
    CASE
        WHEN delivery_time_hours > expected_time_hours THEN 'Delayed'
        ELSE 'On-Time'
    END AS delivery_status_group,
    AVG(delivery_rating) AS avg_rating,
    COUNT(*) AS deliveries
FROM deliveries
GROUP BY delivery_status_group;

--------------------------------------------------
-- 2️⃣ Rating by Delivery Time Bucket
--------------------------------------------------
SELECT
    CASE
        WHEN package_weight_kg < 1 THEN '0-1 kg'
        WHEN package_weight_kg < 5 THEN '1-5 kg'
        WHEN package_weight_kg < 10 THEN '5-10 kg'
        ELSE '10+ kg'
    END AS weight_bucket,
    COUNT(*) AS total_deliveries,
    AVG(delivery_time_hours) AS avg_delivery_time,
    AVG(delivery_cost) AS avg_delivery_cost,
    SUM(CASE
        WHEN delivery_time_hours > expected_time_hours
        THEN 1 ELSE 0
    END) * 1.0 / COUNT(*) AS delay_rate
FROM deliveries
GROUP BY weight_bucket
ORDER BY delay_rate DESC;

-- Source:
-- Kaggle Dataset — Delivery Logistics Performance & Operations
