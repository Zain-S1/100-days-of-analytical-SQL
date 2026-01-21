-- Day 4: Aggregations — Measuring Employee Work Time

-- Question:
-- How much total time did each employee spend working across all sessions?

-- Solution
SELECT event_day AS day, emp_id, SUM(out_time-in_time) AS total_time
FROM Employees
GROUP BY event_day, emp_id;

-- Source:
-- LeetCode 1741 — Find Total Time Spent by Each Employee
