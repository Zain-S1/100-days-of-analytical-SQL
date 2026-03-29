-- Day 41: Weather Impact on Delivery Delays

-- Question:
-- How does weather condition affect delivery delays?

-- Solution
SELECT
    weather_condition,
    COUNT(*) AS total_deliveries,
    SUM(CASE
        WHEN delivery_time_hours > expected_time_hours
        THEN 1 ELSE 0
    END) AS delayed_deliveries,
    SUM(CASE
        WHEN delivery_time_hours > expected_time_hours
        THEN 1 ELSE 0
    END) * 1.0 / COUNT(*) AS delay_rate
FROM deliveries
GROUP BY weather_condition
ORDER BY delay_rate DESC;

-- Insights:
-- * Stormy weather has the worst performance; with nearly 1 in 3+ deliveries delayed.
-- * Rain significantly impacts operations, only slightly better than stormy conditions.
-- * Fog causes moderate disruption, likely due to low visibility.

--------------------------------------------------
-- Source:
-- Kaggle Dataset — Delivery Logistics Performance & Operations
