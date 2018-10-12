-- I wonder if there's a way to get the half of the list without resorting to `div`
-- like, just using /, but without all of the type errors
inFirstHalf n xs = n `elem` firstHalf
  where howManyInFirstHalf = length xs `div` 2
        firstHalf = take howManyInFirstHalf xs
