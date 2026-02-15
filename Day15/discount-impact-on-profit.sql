-- Day 15: Discount Impact on Profit

-- Question:
-- How does discount level affect total profit and profit margin?

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
