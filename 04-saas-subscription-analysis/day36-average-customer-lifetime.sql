-- Day 36: Average Customer Lifetime

-- Question:
-- How much revenue does a customer generate before they churn?

-- Solution
WITH customer_lifetime AS (
    SELECT
        customer_id,
        COUNT(DISTINCT month) AS months_active
    FROM subscriptions
    GROUP BY customer_id
)

SELECT
    AVG(months_active) AS average_customer_lifetime_months
FROM customer_lifetime;

-- Source:
-- Kaggle Dataset — SaaS Business Metrics: Customers, Plans & Revenue
