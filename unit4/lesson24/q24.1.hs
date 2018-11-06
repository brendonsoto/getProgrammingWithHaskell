{-
  Mimicking the `cp` command.
  Should just copy the file to a new named file.

  To simplify the problem let's break it down into the following:
  1. Simply get the argument for the newly named file and echo it
  2. Make an argument for the file to copy
  3. Write the contents of the file to a new file
-}
{-# LANGUAGE OverloadedStrings #-}

import System.IO
import System.Environment
import qualified Data.Text.IO as TIO

main :: IO ()
main = do
  args <- getArgs
  let fileToCopy = head args
  let fileToWriteTo = last args
  contentsToCopy <- TIO.readFile fileToCopy
  TIO.writeFile fileToWriteTo contentsToCopy
  TIO.putStrLn "All done!"
