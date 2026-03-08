-- Day4: Deduplication and Unique Entity Identification

-- Question:
-- What is the first login date for each user?

-- Solution
SELECT 
    player_id, 
    MIN(event_date) AS first_login
FROM Activity
GROUP BY player_id;

-- Source:
-- LeetCode 511 — Game Play Analysis I
