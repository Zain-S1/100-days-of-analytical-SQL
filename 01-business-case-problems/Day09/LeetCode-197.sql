-- Day 9: Time Awareness and Date Comparison

-- Question:
-- Which days recorded a higher temperature compared to the previous day?

-- Solution
SELECT d1.id
FROM Weather d1
JOIN Weather d2
    ON d1.recordDate = DATE_ADD(d2.recordDate, INTERVAL 1 DAY)
WHERE d1.temperature > d2.temperature;

-- Source:
-- LeetCode 197 — Rising Temperature
