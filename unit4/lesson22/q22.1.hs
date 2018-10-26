import Data.List.Split
import Data.Char

-- eval :: String -> Int
-- eval (n1:opperand:n2:_)
--   | opperand == '+' = x + y
--   | opperand == '*' = x * y
--   | otherwise = 0
--   where x = digitToInt n1
--         y = digitToInt n2

-- I thought using currying to combine chars could solve evaluating the expressions as soon as they're entered, but no
-- createExpression :: Char -> Char -> Char -> String
-- createExpression x y z = 

-- I tried. I'm stuck on how to grab just a few chars from a stream of chars and print results immediately
-- main :: IO ()
-- main = do
--   userInput <- getContents
--   mapM_ (print . eval) userInput
  -- interact (show . eval)

-- Book's result
-- calc :: [String] -> Int
-- calc (val1:"+":val2:rest) = read val1 + read val2
-- calc (val1:"*":val2:rest) = read val1 * read val2

-- The book's solution does not work.
-- main :: IO ()
-- main = do
--   userInput <- getContents
--   let values = lines userInput
--   print (calc values)

-- Thanks to the community online here's a solution
-- NOTE This only works with the following input format: "x + y" "x * y" not "x+y"
-- I'm still a bit confused as to how things work so I'm going to make some comments
-- main :: IO ()
-- main = do
--   -- get the input which is a String, an ever growing String, our stream
--   userInput <- getContents 
--   -- lines :: String -> [String] which makes sense considering our stream is a String. The rest is removing spaces.
--   let expressions = map (splitOn " ") . lines 
--   -- we're left with fragmented input like ["1","+","2"] which is what the calc func expects
--   let values = expressions userInput
--   {- This one is what's been bugging me.
--       We evaluate "values" which in turn converts our stream (String) into an Int
--       It's lazily evaluated and we're printing it to the screen.
--       But how is it that we can grab only the most-current non-evaluated parts of the stream? That's what I don't get.
--       I guess this is to be explained more in the chapter about Monads?
--   -} 
--   mapM_ print (map calc values)


-- Going to retry with the new knowledge from above...
-- Repeating code here so I'm not going back and forth within the file
eval :: String -> Int
eval (n1:opperand:n2:_)
  | opperand == '+' = x + y
  | opperand == '*' = x * y
  | otherwise = 0
  where x = digitToInt n1
        y = digitToInt n2

main :: IO ()
main = do
  -- get our input as a stream which is an ever-growing String
  userInput <- getContents
  -- separate the lines
  let expressions = lines userInput
  -- now to print the evaluated expressions
  -- so we're forcing expressions to evaluate through `mapM_ print ...` somehow
  -- but still, how does it keep track of what has been evaluated via expressions???
  mapM_ print (map eval expressions)
