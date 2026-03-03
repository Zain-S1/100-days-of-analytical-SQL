-- Day 30: Kaggle Dataset Exploration — SaaS Subscription Analytics
-- Dataset: SaaS Business Metrics: Customers, Plans & Revenue

-- Tables:

-- (1) customers:
-- customer_id, signup_date, plan_type,
-- monthly_fee, acquisition_cost, churn_date

-- (2) revenue:
-- subscription_id, customer_id, month, monthly_fee,
-- revenue_type, amount

-- (3) subscriptions:
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
-- 4. Monthly Recurring Revenue (MRR)
--------------------------------------------------
SELECT
    month,
    SUM(monthly_fee) AS mrr
FROM subscription
GROUP BY month
ORDER BY month;

--------------------------------------------------
-- 5. Total Revenue
--------------------------------------------------
SELECT
    SUM(amount) AS total_revenue
FROM revenue;

--------------------------------------------------
-- 6. Average Acquisition Cost
--------------------------------------------------
SELECT
    AVG(acquisition_cost) AS avg_ac
FROM customers;

-------------------------------------------------
