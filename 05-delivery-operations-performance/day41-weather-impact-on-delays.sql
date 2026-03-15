-- Day 41: Weather Impact on Delivery Delays

-- Question:
-- How does weather condition affect delivery delays?

-- Solution
SELECT
    plan_type,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn_date IS NOT NULL THEN 1 ELSE 0 END) AS churned_customers,
    SUM(CASE WHEN churn_date IS NOT NULL THEN 1 ELSE 0 END) * 1.0
        / COUNT(*) AS churn_rate
FROM customers
GROUP BY plan_type
ORDER BY churn_rate DESC;

-- Source:
-- Kaggle Dataset — SaaS Business Metrics: Customers, Plans & Revenue
