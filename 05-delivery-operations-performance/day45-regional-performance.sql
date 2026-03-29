-- Day 45: Regional Delivery Performance

-- Question:
-- How does delivery performance vary across regions?

-- Solution
SELECT
    region,
    COUNT(*) AS total_deliveries,
    AVG(delivery_time_hours) AS avg_delivery_time,
    AVG(delivery_cost) AS avg_delivery_cost,
    AVG(delivery_rating) AS avg_rating,
    SUM(CASE
        WHEN delivery_time_hours > expected_time_hours
        THEN 1 ELSE 0
    END) * 1.0 / COUNT(*) AS delay_rate
FROM deliveries
GROUP BY region
ORDER BY delay_rate DESC;

-- Insights:
-- * Better regions are faster and better rated
--   → Confirms that speed and reliability drive customer satisfaction.
-- * Higher delays align with slower delivery times
--   → Suggests systemic inefficiencies (traffic, density, routing).
-- * Cost differences are minor and not decisive
--   → Again, confirms that cost ≠ quality.

--------------------------------------------------
-- Source:
-- Kaggle Dataset — Delivery Logistics Performance & Operations
