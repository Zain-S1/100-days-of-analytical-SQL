-- Day 38: Revenue Concentration by Customer

-- Question:
-- Is revenue evenly distributed across customers, 
-- or is it concentrated among a small group of high-value users?

-- Solution
WITH customer_revenue AS (
    SELECT
        customer_id,
        SUM(amount) AS lifetime_revenue
    FROM revenue
    GROUP BY customer_id
),

revenue_segments AS (
    SELECT
        customer_id,
        lifetime_revenue,
        CASE
            WHEN lifetime_revenue >= 500 THEN 'High Value'
            WHEN lifetime_revenue >= 200 THEN 'Medium Value'
            ELSE 'Low Value'
        END AS customer_segment
    FROM customer_revenue
)

SELECT
    customer_segment,
    COUNT(*) AS customers,
    SUM(lifetime_revenue) AS total_revenue
FROM revenue_segments
GROUP BY customer_segment
ORDER BY total_revenue DESC;

-- Source:
-- Kaggle Dataset — SaaS Business Metrics: Customers, Plans & Revenue
