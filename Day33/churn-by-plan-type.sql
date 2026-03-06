-- Day 3: Churn by Plan Type

-- Question:
-- Which subscription plans experience the highest churn rates?

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
