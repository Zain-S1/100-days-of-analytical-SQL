-- Day 3: Identifying High Earners (Sorting vs Ranking)

-- Question:
-- What is the Nth highest salary in the company for compensation benchmarking?

-- Solution
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  SET N = N - 1;
  RETURN (
      SELECT salary AS getNthHighestSalary
      FROM (
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT 1 OFFSET N
      ) S
  );
END

-- Source:
-- LeetCode 177 — Nth Highest Salary
