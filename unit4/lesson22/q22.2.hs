import Data.Char
import System.Exit

selectQuote :: Char -> String
selectQuote c
  | c =='1' = "yolo"
  | c =='2' = "i am your father"
  | c =='3' = "you are not the father"
  | c =='4' = "and i will always love you"
  | c =='5' = "i'm batman"
  | c =='n' = ""
  | otherwise = "invalid input. please pick 1 - 5 for a quote or 'n' to end"

respondToInput :: String -> IO ()
respondToInput quote =
  if quote == ""
     then exitSuccess
     else print quote

main :: IO ()
main = do
  putStrLn "Would you like a quote?"
  userInput <- getContents
  let selection = concat . lines $ userInput
  mapM_ respondToInput (map selectQuote selection)
