-- Day 1: Customers With No Orders

-- Question:
-- Which customers have never placed an order?

-- Solution
SELECT 
    c.name AS Customers
FROM Customers c
LEFT JOIN Orders o
    ON c.id = o.customerId
WHERE o.id IS NULL;

-- Source:
-- LeetCode 183 — Customers Who Never Order
