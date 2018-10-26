main :: IO ()
main = do
  userInput <- getContents
  let numbers = toInts userInput
  let sumOfSquares = sum . map (^2) $ numbers
  print sumOfSquares

toInts :: String -> [Int]
toInts = map read . lines
