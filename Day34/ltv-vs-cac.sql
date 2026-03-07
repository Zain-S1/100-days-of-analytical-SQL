-- Day 34: LTV vs CAC Comparison

-- Question:
-- What is the average lifetime value of a customer, 
-- and how does it compare to acquisition cost (CAC)?

-- Solution
WITH customer_revenue AS (
    SELECT
        customer_id,
        SUM(amount) AS lifetime_revenue
    FROM revenue
    GROUP BY customer_id
)

SELECT
    AVG(lifetime_revenue) AS average_ltv,
    (SELECT AVG(acquisition_cost) FROM customers) AS average_cac,
    AVG(lifetime_revenue) /
    (SELECT AVG(acquisition_cost) FROM customers) AS ltv_to_cac_ratio
FROM customer_revenue;

-- Source:
-- Kaggle Dataset — SaaS Business Metrics: Customers, Plans & Revenue
