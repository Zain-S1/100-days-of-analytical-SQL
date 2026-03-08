-- Day 2: Identifying Incomplete Employee Records

-- Question:
-- Which employees have missing information across HR and payroll systems?

-- Solution
SELECT e.employee_id
FROM Employees e
LEFT JOIN Salaries s
    ON e.employee_id = s.employee_id
WHERE s.employee_id IS NULL

UNION 

SELECT s.employee_id
FROM Salaries s
LEFT JOIN Employees e
    ON s.employee_id = e.employee_id
WHERE e.employee_id IS NULL

ORDER BY employee_id ASC;

-- Source:
-- LeetCode 1965 — Employees With Missing Information
