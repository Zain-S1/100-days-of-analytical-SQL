-- Day 34: Customer Lifetime Value (LTV)

-- Question:
-- How much revenue does a customer generate before they churn?

-- Solution
WITH customer_revenue AS (
    SELECT
        customer_id,
        SUM(amount) AS lifetime_revenue
    FROM revenue
    GROUP BY customer_id
)

SELECT
    AVG(lifetime_revenue) AS average_ltv
FROM customer_revenue;

-- Source:
-- Kaggle Dataset — SaaS Business Metrics: Customers, Plans & Revenue
