-- Day 14: Profit Margin by Category

-- Question:
-- What is the profit margin for each product category?

-- Solution
SELECT
    o1.order_id,
    o1.order_date,
    o1.customer_id,
    CASE
        WHEN o1.order_date = (
            SELECT MIN(o2.order_date)
            FROM orders o2
            WHERE o2.customer_id = o1.customer_id;
        )
        THEN 'First-Time'
        ELSE 'returing'
    END AS customer_type
FROM orders o1
ORDER BY o1.order_date;

-- Source:
-- Generic Orders Table (Concept Exercise)
