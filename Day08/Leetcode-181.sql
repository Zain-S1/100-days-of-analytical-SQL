-- Day 8: Self-JOINs — Comparing Related Records

-- Question:
-- Which employees earn more than their direct managers?

-- Solution
SELECT e.name AS Employee
FROM Employee e
INNER JOIN Employee m
    ON m.id = e.managerId
WHERE e.salary > m.salary;

-- Source:
-- LeetCode 181 — Employees Earning More Than Their Managers
