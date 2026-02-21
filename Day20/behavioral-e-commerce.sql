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
-- 4. Average Order Value (AOV)
--------------------------------------------------


--------------------------------------------------

