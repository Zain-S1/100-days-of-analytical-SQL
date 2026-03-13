How long it takes to recover acquisition cost from subscription revenue.
-- Day 38: Revenue Concentration by Customer

-- Question:
-- Is revenue evenly distributed across customers, 
-- or is it concentrated among a small group of high-value users?

-- Solution
WITH customer_lifetime AS (
    SELECT
        customer_id,
        COUNT(DISTINCT month) AS months_active
    FROM subscription
    GROUP BY customer_id
),

customer_revenue AS (
    SELECT
        customer_id,
        SUM(amount) AS lifetime_revenue
    FROM revenue
    GROUP BY customer_id
)

SELECT
    AVG(c.acquisition_cost) AS avg_cac,
    AVG(cr.lifetime_revenue) AS avg_ltv,
    AVG(cr.lifetime_revenue) /
    AVG(cl.months_active) AS avg_monthly_revenue_per_customer,
    AVG(c.acquisition_cost) /
    (AVG(cr.lifetime_revenue) / AVG(cl.months_active)) AS cac_payback_months
FROM customers c
JOIN customer_revenue cr
    ON c.customer_id = cr.customer_id
JOIN customer_lifetime cl
    ON c.customer_id = cl.customer_id;

-- Source:
-- Kaggle Dataset — SaaS Business Metrics: Customers, Plans & Revenue
