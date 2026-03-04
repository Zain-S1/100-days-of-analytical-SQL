-- Day 26: Churn by Signup Cohort

-- Question:
-- How does churn vary across signup cohorts?

-- Solution
WITH cohorts AS (
    SELECT
        customer_id,
        DATE_TRUNC('month', signup_date) AS signup_cohort,
        churn_date
    FROM customers
)

SELECT
    signup_cohort,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN churn_date IS NOT NULL THEN 1 ELSE 0 END) AS churned_customers,
    SUM(CASE WHEN churn_date IS NOT NULL THEN 1 ELSE 0 END) * 1.0
        / COUNT(*) AS churn_rate
FROM cohorts
GROUP BY signup_cohort
ORDER BY signup_cohort;

-- Source:
-- Kaggle Dataset — SaaS Business Metrics: Customers, Plans & Revenue
