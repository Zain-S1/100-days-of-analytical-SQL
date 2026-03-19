-- Day 44: Delivery Partner Performance
-- Dataset: Delivery Operations Data

-- Question:
-- How do delivery partners compare in performance?

-- Solution
SELECT
    delivery_partner,
    COUNT(*) AS total_deliveries,
    AVG(delivery_time_hours) AS avg_delivery_time,
    AVG(delivery_cost) AS avg_delivery_cost,
    AVG(delivery_rating) AS avg_rating,
    SUM(CASE
        WHEN delivery_time_hours > expected_time_hours
        THEN 1 ELSE 0
    END) * 1.0 / COUNT(*) AS delay_rate
FROM deliveries
GROUP BY delivery_partner
ORDER BY delay_rate DESC;

-- Source:
-- Kaggle Dataset — Delivery Logistics Performance & Operations
