import System.Environment
import Control.Monad

-- main :: IO ()
-- main = do
--   args <- getArgs
--   mapM_ putStrLn args


-- Quick check 22.1
-- main :: IO ()
-- main = do
--   args <- mapM (\_ -> getLine) [1 .. 3]
--   mapM_ putStrLn args

-- Continuing from Listing 22.4
main :: IO ()
main = do
  args <- getArgs
  let linesToRead = if length args > 0
                       then read (head args)
                       else 0 :: Int
  numbers <- replicateM linesToRead getLine
  let ints = map read numbers :: [Int]
  print (sum ints)


-- Quick check 22.2
-- myReplicateM f n = mapM (\_ -> f) [1 .. n]
