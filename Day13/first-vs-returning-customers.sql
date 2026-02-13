-- Day 13: First-Time vs Returning Customers

-- Assumed Table:
-- orders(order_id, customer_id, order_date)

-- Question:
-- For each order, is the customer making their first purchase
-- or are they a returning customer?

-- Solution
SELECT
    o1.order_id,
    r1.order_date,
    r1.customer_id,
    CASE
        WHEN r1.order_date = (
            SELECT MIN(r2.order_date)
            FROM retail_orders r2
            WHERE r2.customer_id = r1.customer_id;
        )
        THEN 'First-Time'
        ELSE 'returing'
    END AS customer_type
FROM retail_orders r1
ORDER BY r1.order_date;

-- Source:
-- Generic Orders Table (Concept Exercise)
