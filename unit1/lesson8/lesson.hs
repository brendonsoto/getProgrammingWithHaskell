-- implementing length
length' [] = 0
length' (x:xs) = 1 + length' xs

-- take was implemented in lesson7's "consider this"

-- implementing cycle
cycle' [] = []
cycle' xs = xs ++ cycle' xs


-- 8.3.1 Ackerman function
ackermann 0 n = n + 1
ackermann m 0 = ackermann (m - 1) 1
ackermann m n = ackermann (m - 1) (ackermann m (n - 1))

-- Collatz conjecture
collatz 1 = 1
collatz n = if even n
               then 1 + collatz (n `div` 2)
               else 1 + collatz (n * 3 + 1)
