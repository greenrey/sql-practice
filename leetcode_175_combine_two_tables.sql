-- 🧩 Leetcode 175. Combine Two Tables
-- 🔗 https://leetcode.com/problems/combine-two-tables/description
-- 🎯 Combine two tables and select first name, last name, city, and state of each person. 

SELECT firstName
     , lastName 
     , city
     , state
  FROM Person as P
  LEFT
  JOIN Address as A
    ON P.personId = A.personId;
