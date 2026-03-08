-- Day 5: GROUP BY — Managerial Span of Control

-- Question:
-- How many employees report directly to each manager?

-- Solution
SELECT 
    e.reports_to AS employee_id, 
    m.name, 
    COUNT(e.employee_id) AS reports_count, 
    ROUND(AVG(e.age), 0) AS average_age
FROM Employees e
JOIN Employees m
    ON e.reports_to = m.employee_id
GROUP BY e.reports_to
ORDER BY employee_id;

-- Source:
-- LeetCode 1731 — The Number of Employees Which Report to Each Employee
