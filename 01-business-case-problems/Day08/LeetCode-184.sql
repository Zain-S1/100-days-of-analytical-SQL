-- Day 8: Group-Level Comparison and Exclusion

-- Question:
-- Which employees earn the highest salary within their department?

-- Solution
SELECT 
    d.name AS Department, 
    e.name AS Employee, 
    e.salary AS Salary
FROM Employee e
JOIN Department d
    ON e.departmentId = d.id
WHERE e.salary = (
    SELECT MAX(salary)
    FROM Employee
    WHERE departmentId = e.departmentId
);

-- Source:
-- LeetCode 184 — Department Highest Salary
