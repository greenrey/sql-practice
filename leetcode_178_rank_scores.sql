-- 🧩 Leetcode 178. Rank Scores
-- 🔗 https://leetcode.com/problems/rank-scores/description/
-- 🎯 Find the rank of the scores using DENSE_RANK

SELECT score
     , DENSE_RANK() OVER (ORDER BY score DESC) AS 'rank'
  FROM Scores;
 
