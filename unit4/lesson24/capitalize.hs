{-
  Reads a file and rewrites the file captialized.

  Breaking it down to the following steps:
  1. Write a function that takes Text and returns it capitalized
    ^nvm. that exists. toUpper
  2. Write a main func that gets an argument and returns it prepended with 'capitalized'
  3. Tie 1 & 2
-}

import System.Environment
import qualified Data.Text as T
import qualified Data.Text.IO as TIO

main :: IO ()
main = do
  args <- getArgs
  let file = head args
  let newFile = mconcat ["cap_",file]
  contents <- TIO.readFile file
  TIO.writeFile newFile (T.toUpper contents)
