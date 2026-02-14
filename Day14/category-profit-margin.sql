-- Day 14: Profit Margin by Category

-- Question:
-- What is the profit margin for each product category?

-- Solution
SELECT
    category,
    SUM(
        (list_price * quantity * (1 - discount / 100.0))
        - (cost_price * quantity)
    ) AS total_profit,
    SUM(
        list_price * quantity * (1 - discount / 100.0)
    ) AS total_revenue,
    SUM(
        (list_price * quantity * (1 - discount / 100.0))
        - (cost_price * quantity)
    )
    /
    SUM(
        list_price * quantity * (1 - discount / 100.0)
    ) AS profit_margin
FROM retail_orders
GROUP BY category
ORDER BY profit_margin DESC;

-- Source:
-- Kaggle Dataset — Retail Orders
