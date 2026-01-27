-- Day 1: Filtering Products by Business Rules

-- Question:
-- Which products meet both health and sustainability criteria?

-- Solution
SELECT product_id
FROM Products
WHERE low_fats = 'Y' 
    AND recyclable = 'Y';

-- Source:
-- LeetCode 1757 — Recyclable and Low Fat Products
