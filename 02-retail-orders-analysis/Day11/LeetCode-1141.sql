-- Day 11: Daily Active Users (DAU)

-- Question:
-- How many unique users were active each day during the
-- 30-day period ending on 2019-07-27 (inclusive)?

-- Solution
SELECT 
    activity_date AS day, 
    COUNT(DISTINCT(user_id)) AS active_users
FROM Activity
WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27'
GROUP BY activity_date;

-- Source:
-- LeetCode 1141 — User Activity for the Past 30 Days I
