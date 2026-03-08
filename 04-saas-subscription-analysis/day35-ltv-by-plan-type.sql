-- Day 35: Customer Lifetime Value by Plan Type

-- Question:
-- How does Customer Lifetime Value differ across subscription plans?

-- Solution
WITH customer_ltv AS (
    SELECT
        customer_id,
        SUM(amount) AS lifetime_revenue
    FROM revenue
    GROUP BY customer_id
)

SELECT
    c.plan_type,
    COUNT(DISTINCT c.customer_id) AS total_customers,
    AVG(cl.lifetime_revenue) AS average_ltv
FROM customers c
JOIN customer_ltv cl
    ON c.customer_id = cl.customer_id
GROUP BY c.plan_type
ORDER BY average_ltv DESC;

-- Source:
-- Kaggle Dataset — SaaS Business Metrics: Customers, Plans & Revenue
