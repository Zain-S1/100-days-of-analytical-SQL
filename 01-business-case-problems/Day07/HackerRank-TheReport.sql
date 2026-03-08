-- Day 7: JOINs with NULL Detection

-- Question:
-- How can we associate students with grades while
-- identifying cases where names should be hidden
-- based on performance rules?

-- Solution
SELECT
    CASE 
        WHEN g.Grade < 8 THEN NULL
        ELSE s.Name
    END AS Name,
    g.Grade,
    s.Marks
FROM Students s 
JOIN Grades g 
    ON s.Marks BETWEEN g.Min_Mark AND g.Max_Mark
ORDER BY g.Grade DESC, s.Name ASC;

-- Source:
-- HackerRank — The Report
