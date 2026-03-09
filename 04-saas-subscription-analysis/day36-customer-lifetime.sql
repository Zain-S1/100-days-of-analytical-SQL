-- Day 36: Customer Lifetime

-- Question:
-- How long did each customer remain subscribed?

-- Solution
SELECT
    customer_id,
    COUNT(DISTINCT month) AS months_active
FROM subscriptions
GROUP BY customer_id;

-- Source:
-- Kaggle Dataset — SaaS Business Metrics: Customers, Plans & Revenue
