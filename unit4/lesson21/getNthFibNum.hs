-- From q.8.2
fastFib n1 n2 0 = n1 + n2
fastFib n1 n2 counter =
  if counter == 1
     then n2
     else fastFib (n1 + n2) n1 (counter - 1)


main :: IO ()
main = do
  putStrLn "What number of the fibonacci sequence would you like?"
  num <- getLine
  let fibNum = fastFib 1 1 (read num)
  putStrLn ("The " ++ show num ++ "th fibonacci number is " ++ show fibNum ++ ".")
