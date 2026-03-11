-- Day 37: Monthly Churn Rate

-- Question:
-- What percentage of active customers cancel their subscription each month?

-- Solution
WITH monthly_customers AS (
    SELECT
        month,
        COUNT(DISTINCT customer_id) AS active_customers
    FROM subscription
    GROUP BY month
),

monthly_churn AS (
    SELECT
        DATE_FORMAT(churn_date, '%Y-%m') AS churn_month,
        COUNT(*) AS churned_customers
    FROM customers
    WHERE churn_date IS NOT NULL
    GROUP BY churn_month
)

SELECT
    mc.month,
    mc.active_customers,
    COALESCE(ch.churned_customers, 0) AS churned_customers,
    COALESCE(ch.churned_customers, 0) * 1.0 / mc.active_customers AS churn_rate
FROM monthly_customers mc
LEFT JOIN monthly_churn ch
    ON mc.month = ch.churn_month
ORDER BY mc.month;

-- Source:
-- Kaggle Dataset — SaaS Business Metrics: Customers, Plans & Revenue
