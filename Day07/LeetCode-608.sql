-- Day 7: NULL Semantics — Classifying Hierarchical Data

-- Question:
-- Classify each node in an organizational hierarchy as Root, Inner, or Leaf.

-- Solution
SELECT id,
    CASE 
        WHEN p_id IS NULL THEN 'Root'
        WHEN id NOT IN (SELECT DISTINCT p_id FROM Tree WHERE p_id IS NOT NULL) THEN 'Leaf'
        ELSE 'Inner'
    END AS type
FROM Tree;

-- Source:
-- LeetCode 608 — Tree Node
