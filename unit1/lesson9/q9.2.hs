-- hmmm, how to do this without Prelude's toLower ...
-- I'll make my own toLower
getAlphaIndex x = index
  where
    capAlpha = ['A'..'Z']
    alphaIndexPairs = zip capAlpha [0..]
    matchingPair = head (filter (\n -> fst n == x) alphaIndexPairs)
    index = snd matchingPair

toLower x = if x `elem` ['A'..'Z']
               then ['a'..'z'] !! getAlphaIndex x
               else x

isPalindrome xs = lowerCased == reverse lowerCased
  where
    sansSpaces = filter (== ' ') xs
    lowerCased = map toLower sansSpaces
