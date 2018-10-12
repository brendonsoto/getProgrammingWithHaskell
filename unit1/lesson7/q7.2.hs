myGCD a b
  | remainder == 0 = b
  | otherwise = myGCD b remainder
  where remainder = a `mod` b
