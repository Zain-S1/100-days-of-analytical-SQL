-- Day 3: Grouping and Aggregation with HAVING

-- Question:
-- Which classes have a student count exceeding the enrollment threshold?

-- Solution
SELECT 
    class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;

-- Source:
-- LeetCode 596 — Classes With at Least 5 Students
