-- Day 37: Monthly Churn Rate

-- Question:
-- What percentage of active customers cancel their subscription each month?

-- Solution
WITH customer_lifetime AS (
    SELECT
        customer_id,
        COUNT(DISTINCT month) AS months_active
    FROM subscription
    GROUP BY customer_id
)

SELECT
    c.plan_type,
    AVG(cl.months_active) AS avg_lifetime_months
FROM customers c
JOIN customer_lifetime cl
    ON c.customer_id = cl.customer_id
GROUP BY c.plan_type
ORDER BY avg_lifetime_months DESC;

-- Source:
-- Kaggle Dataset — SaaS Business Metrics: Customers, Plans & Revenue
