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
        WHEN delivery_time_hours < 3 THEN '< 3 hrs'
        WHEN delivery_time_hours < 6 THEN '3-6 hrs'
        WHEN delivery_time_hours < 10 THEN '6-10 hrs'
        ELSE '10+ hrs'
    END AS time_bucket,
    AVG(delivery_rating) AS avg_rating
FROM deliveries
GROUP BY time_bucket
ORDER BY avg_rating DESC;

--------------------------------------------------
-- 3️⃣ Rating by Delivery Cost Bucket
--------------------------------------------------

-- Source:
-- Kaggle Dataset — Delivery Logistics Performance & Operations
