-- Day 30: Kaggle Dataset Exploration — SaaS Subscription Analytics
-- Dataset: SaaS Business Metrics: Customers, Plans & Revenue

-- Tables:

-- (1) customers:
-- customer_id, signup_date, plan_type,
-- monthly_fee, acquisition_cost, churn_date

-- (2) revenue:
-- subscription_id, customer_id, month, monthly_fee,
-- revenue_type, amount

-- (3) subscription:
-- subscription_id, customer_id, month, monthly_fee

--------------------------------------------------
-- 1. Total Customers
--------------------------------------------------
SELECT COUNT(*) AS total_customers
FROM customers;

--------------------------------------------------
-- 2. Active Customers
--------------------------------------------------
SELECT COUNT(*) AS active_customers
FROM customers
WHERE churn_date IS NULL;

--------------------------------------------------
-- 3. Churn Rate
--------------------------------------------------
SELECT
    SUM(CASE WHEN churn_rate IS NOT NULL THEN 1 ELSE 0 END) * 1.0
    / COUNT(*) AS churn_rate
FROM customers;

--------------------------------------------------
-- 4. Conversion Rate (Session-Level)
--------------------------------------------------
WITH sessions AS (
    SELECT DISTINCT user_session
    FROM ecommerce_events
),
purchase_sessions AS (
    SELECT DISTINCT user_session
    FROM ecommerce_events
    WHERE event_type = 'purchase'
)

SELECT
    COUNT(DISTINCT p.user_session) * 1.0
    / COUNT(DISTINCT s.user_session) AS session_conversion_rate
FROM sessions s
LEFT JOIN purchase_sessions p
    ON s.user_session = p.user_session;

--------------------------------------------------
-- 5. Top 5 Categories by Revenue
--------------------------------------------------
SELECT
    category_code,
    SUM(price) AS category_revenue
FROM ecommerce_events
WHERE event_type = 'purchase'
GROUP BY category_code
ORDER BY category_revenue DESC
LIMIT 5;

--------------------------------------------------
-- 6. Average Order Value (Session-Based)
--------------------------------------------------
WITH session_revenue AS (
    SELECT
        user_session,
        SUM(price) AS session_total
    FROM ecommerce_events
    WHERE event_type = 'purchase'
    GROUP BY user_session
)

SELECT
    AVG(session_total) AS average_order_value
FROM session_revenue;

--------------------------------------------------
