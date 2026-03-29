-- Day 43: Vehicle Type Efficiency

-- Question:
-- How does vehicle type impact delivery time, delays, and cost?

-- Solution
SELECT
    vehicle_type,
    COUNT(*) AS total_deliveries,
    AVG(delivery_time_hours) AS avg_delivery_time,
    AVG(delivery_cost) AS avg_delivery_cost,
    AVG(delivery_rating) AS avg_rating,
    SUM(CASE
        WHEN delivery_time_hours > expected_time_hours
        THEN 1 ELSE 0
    END) * 1.0 / COUNT(*) AS delay_rate
FROM deliveries
GROUP BY vehicle_type
ORDER BY delay_rate DESC;

-- Insights:
-- * Overall, delays are system-driven (distance, routing, weather), not vehicle-driven

--------------------------------------------------
-- Source:
-- Kaggle Dataset — Delivery Logistics Performance & Operations
