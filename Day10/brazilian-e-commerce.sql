-- Day 10: Kaggle Dataset Exploration — Brazilian E-Commerce

-- Tables:

-- (1) orders:
-- order_id, customer_id, order_status
-- order_purchase_timestamp

-- (2) order_items:
-- order_id, order_item_id, product_id,
-- price, freight_value

--------------------------------------------------
-- 1. Total Revenue
--------------------------------------------------
SELECT
    SUM(price + freight_value) AS total_revenue
FROM order_items

--------------------------------------------------
-- 2. Revenue by Order Status
--------------------------------------------------
SELECT
    o.order_status,
    SUM(oi.price + oi.freight_value) AS revenue
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY o.order_status
ORDER BY revenue DESC;

--------------------------------------------------
-- 3. Top 5 Products by Revenue
--------------------------------------------------
SELECT
    product_id,
    SUM(price + freight_value) AS product_revenue
FROM order_items
GROUP BY product_id
ORDER BY product_revenue DESC
LIMIT 5;

--------------------------------------------------
-- 4. Average Order Value (AOV)
--------------------------------------------------
SELECT
    ROUND(
        SUM(price + freight_value)
        / COUNT(DISTINCT order_id),
        2
    ) AS average_order_value
FROM order_items;

--------------------------------------------------
-- Next Steps
-- * Revenue trends over time
-- * Regional performance analysis
