-- Day 17: Running Total Revenue

-- Question:
-- What is the profit ranking of each product based on total generated profit?

-- Solution
WITH product_profit AS (
    SELECT
        product_id,
        SUM(
            (list_price * quantity * (1 - discount / 100.0))
            - (cost_price * quantity)
        ) AS total_profit
    FROM retail_orders
    GROUP BY product_id
)
SELECT
    product_id,
    total_profit,
    RANK() OVER (ORDER BY total_profit DESC) AS profit_rank
FROM product_profit
ORDER BY profit_rank;

-- Source:
-- Kaggle Dataset — Retail Orders
