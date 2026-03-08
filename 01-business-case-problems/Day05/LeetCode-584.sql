-- Day 5: Handling NULL Values

-- Question:
-- Which customers were not referred by a specific individual
-- or have no referral information?

-- Solution
SELECT name
FROM Customer
WHERE referee_id != 2 
    OR referee_id IS NULL;

-- Source:
-- LeetCode 584 — Find Customer Referee
