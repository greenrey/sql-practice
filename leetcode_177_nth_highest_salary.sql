-- 🧩 Leetcode 177. Nth Highest Salary
-- 🔗 https://leetcode.com/problems/nth-highest-salary/
-- 🎯 Select Nth highest Salary using OFFSET

CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
     SET N = N-1;
  RETURN (
          SELECT DISTINCT salary 
            FROM Employee
           ORDER
              BY salary DESC
           LIMIT 1 OFFSET N
         );
END
