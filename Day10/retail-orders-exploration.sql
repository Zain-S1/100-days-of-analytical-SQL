-- Day 10: Kaggle Dataset Exploration — Retail Orders

-- Columns:
-- Order Id, Order Date, Ship Mode, Segment,
-- Country, City, State, Postal Code, Region,
-- Category, Sub Category, Product Id,
-- cost price, List Price, Quantity, Discount Percent

--------------------------------------------------
-- 1. Total Revenue
--------------------------------------------------
SELECT
    ROUND(
        SUM(list_price * quantity * (1 - discount / 100.0)),
        2
    ) AS total_revenue
FROM retail_orders

-- Insight:
-- Establishes top-line sales performance.

--------------------------------------------------
-- 2. Revenue by Category
--------------------------------------------------
SELECT
    category,
    ROUND(
        SUM(list_price * quantity * (1 - discount / 100.0)),
        2
    ) AS revenue
FROM retail_orders
GROUP BY category
ORDER BY revenue DESC;

-- Insight:
-- Identifies which categories contribute most to revenue.
-- Useful for assortment and strategic focus decisions.

--------------------------------------------------
-- 3. Top 5 Products by Revenue
--------------------------------------------------
SELECT
    product_id,
    ROUND(
        SUM(list_price * quantity * (1 - discount / 100.0)),
        2
    ) AS revenue
FROM retail_orders
GROUP BY product_id
ORDER BY revenue DESC
LIMIT 5;

-- Insight:
-- Highlights revenue-driving products.
-- Often used for promotions and demand planning.

--------------------------------------------------
-- 4. Average Order Value (AOV)
--------------------------------------------------
SELECT
    ROUND(
        SUM(list_price * quantity * (1 - discount / 100.0))
        / COUNT(DISTINCT order_id),
        2
    ) AS aov
FROM retail_orders;

-- Insight:
-- AOV measures average customer spend per order.
-- Increasing AOV directly increases revenue without acquiring new customers.
