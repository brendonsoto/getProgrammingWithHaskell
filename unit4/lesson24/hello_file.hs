import System.IO

-- Listing 24.3
-- main :: IO ()
-- main = do
--   helloFile <- openFile "hello.txt" ReadMode
--   firstLine <- hGetLine helloFile
--   putStrLn firstLine
--   secondLine <- hGetLine helloFile
--   goodbyeFile <- openFile "goodbye.txt" WriteMode
--   hPutStrLn goodbyeFile secondLine
--   hClose helloFile
--   hClose goodbyeFile
--   putStrLn "done!"

-- Listing 24.4
main :: IO ()
main = do
  helloFile <- openFile "hello.txt" ReadMode
  hasLine <- hIsEOF helloFile
  firstLine <- if not hasLine
                  then hGetLine helloFile
                  else return "empty"
  -- Quick Check 24.2
  hasAnotherLine <- hIsEOF helloFile
  secondLine <- if not hasAnotherLine
                   then hGetLine helloFile
                   else return "empty"
  putStrLn "done!"
