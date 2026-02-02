-- Day 2: Applying Conditional Filters

-- Question:
-- Which movies meet the platform’s quality criteria?

-- Solution
SELECT 
    id, 
    movie, 
    description, 
    rating
FROM Cinema
WHERE (MOD(id, 2) <> 0) 
    AND (description <> 'boring')
ORDER BY rating DESC;

-- Source:
-- LeetCode 620 — Not Boring Movies
