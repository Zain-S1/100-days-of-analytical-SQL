-- Day 36: Customer Lifetime

-- Question:
-- How much revenue does a customer generate before they churn?

-- Solution
SELECT
    customer_id,
    COUNT(DISTINCT month) AS months_active
FROM subscriptions
GROUP BY customer_id;

-- Source:
-- Kaggle Dataset — SaaS Business Metrics: Customers, Plans & Revenue
