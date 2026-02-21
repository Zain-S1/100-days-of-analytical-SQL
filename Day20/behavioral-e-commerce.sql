-- Day 20: Kaggle Dataset Exploration — Behavioral E-Commerce Performance Summary
-- Dataset: E-Commerce Behavior Data from Multi-Category Store

-- Columns:

-- event_time, event_type, product_id, category_id,
-- category_code, brand, price, user_id, user_session

--------------------------------------------------
-- 1. Total Revenue (Purchases Only)
--------------------------------------------------
SELECT
    SUM(price) AS total_revenue
FROM ecommerce_events
WHERE event_type = 'purchase';

--------------------------------------------------
-- 2. Total Unique Purchasing Users
--------------------------------------------------
SELECT
    COUNT(DISTINCT user_id) AS unique_purchasing_users
FROM ecommerce_events
WHERE event_type = 'purchase';

--------------------------------------------------
-- 3. Total Sessions With Purchases
--------------------------------------------------
SELECT
    COUNT(DISTINCT user_session) AS purchasing_sessions
FROM ecommerce_events
WHERE event_type = 'purchase';

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

