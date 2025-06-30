--- 🧩 Leetcode 175. Combine Two Tables
--- 🔗 https://leetcode.com/problems/combine-two-tables/description
--- 🎯 Write a solution to report the first name, last name, city, and state of each person in the Person table. 

SELECT firstName
     , lastName 
     , city
     , state
  FROM Person as P
  LEFT
  JOIN Address as A
    ON P.personId = A.personId;
