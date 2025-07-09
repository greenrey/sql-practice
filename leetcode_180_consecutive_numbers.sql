-- 🧩 Leetcode 180. Consecutive Numbers
-- 🔗 https://leetcode.com/problems/consecutive-numbers/description/
-- 🎯 Find all numbers that appear at least three times consecutively. 

# Solution 1 (619ms)
SELECT DISTINCT LB.num as ConsecutiveNums
  FROM Logs as LA 
     , Logs as LB
     , Logs as LC
WHERE LB.id = LA.id+1 
  AND LB.id = LC.id-1
  AND LB.num=LA.num 
  AND LB.num=LC.num

# Solution with LAG/LEAD function and PARTITION (738ms)
SELECT DISTINCT num as ConsecutiveNums
  FROM (SELECT id
             , num
             , LAG(id) OVER(PARTITION BY num ORDER BY num, id) AS id_prev
             , LEAD(id) OVER(PARTITION BY num ORDER BY num, id) AS id_next
          FROM Logs) AS L
  WHERE L.id_prev = L.id - 1 AND L.id_next = L.id + 1

# Solution with LAG/LEAD function (635ms)
SELECT DISTINCT num as ConsecutiveNums
  FROM (SELECT num
             , LAG(num) OVER(ORDER BY id) AS num_prev
             , LEAD(num) OVER(ORDER BY id) AS num_next
          FROM Logs) AS L
  WHERE L.num = L.num_prev AND L.num = L.num_next

# Solution with LEFT JOIN (584ms)
SELECT DISTINCT LA.num as ConsecutiveNums
  FROM Logs as LA
  LEFT
  JOIN Logs as LB
    ON LB.id = LA.id-1
  LEFT
  JOIN Logs as LC
    ON LC.id = LA.id+1
 WHERE LA.num = LB.num AND LA.num = LC.num
