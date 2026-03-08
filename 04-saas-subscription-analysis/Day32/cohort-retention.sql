-- Day 32: Cohort Retention Analysis

-- Question:
-- What percentage of customers remain active
-- each month after signup?

-- Solution
WITH cohort_data AS (
    SELECT
        s.customer_id,
        DATE_TRUNC('month', c.signup_date) AS cohort_month,
        DATE_TRUNC('month', s.month) AS activity_month
    FROM subscriptions s
    JOIN customers c
        ON s.customer_id = c.customer_id
),

cohort_index AS (
    SELECT
        customer_id,
        cohort_month,
        activity_month,
        EXTRACT(YEAR FROM activity_month) * 12 +
        EXTRACT(MONTH FROM activity_month)
        -
        (EXTRACT(YEAR FROM cohort_month) * 12 +
         EXTRACT(MONTH FROM cohort_month)) AS month_number
    FROM cohort_data
)

SELECT
    cohort_month,
    month_number,
    COUNT(DISTINCT customer_id) AS active_customers
FROM cohort_index
GROUP BY cohort_month, month_number
ORDER BY cohort_month, month_number;

-- Source:
-- Kaggle Dataset — SaaS Business Metrics: Customers, Plans & Revenue
