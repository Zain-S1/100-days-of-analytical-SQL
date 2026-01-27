-- Day 6: Finding Duplicate Emails (HAVING)

-- Question:
-- Which email addresses appear more than once, indicating potential duplicates?

-- Solution
SELECT email AS Email
FROM Person
GROUP BY Email
HAVING COUNT(email) > 1;

-- Source:
-- LeetCode 182 — Duplicate Emails
