-- Day 6: JOINs and Relationship Reasoning

-- Question:
-- Which employees manage a sufficiently large number of direct reports?

-- Solution
SELECT e1.name
FROM Employee e1
JOIN Employee e2
    ON e1.id = e2.managerId
GROUP BY e1.id, e1.name
HAVING COUNT(e1.id) >= 5;

-- Source:
-- LeetCode 570 — Managers with at Least 5 Direct Reports
