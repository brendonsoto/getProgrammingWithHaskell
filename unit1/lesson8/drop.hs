drop' n xs
  | n <= 0 = xs
  | otherwise = drop' (n - 1) (tail xs)
