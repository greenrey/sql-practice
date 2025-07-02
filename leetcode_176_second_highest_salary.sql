-- 🧩 Leetcode 176. Second Highest Salary
-- 🔗 https://leetcode.com/problems/second-highest-salary/description/
-- 🎯 Dense rank salary and find the second highest one.

SELECT MAX(B.salary) AS SecondHighestSalary # Choose the highest value between null and numeric
  FROM (SELECT salary
     , DENSE_RANK() OVER (ORDER BY salary DESC) AS srank # Dense rank salary
       FROM Employee) AS A
  LEFT
  JOIN Employee AS B # To get null if there's no second highest value
    ON A.salary = B.salary
   AND A.srank=2; # Select where rank = 2
