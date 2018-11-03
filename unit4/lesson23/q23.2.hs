import qualified Data.Text.Lazy as TL
import qualified Data.Text.Lazy.IO as TLIO

toInts :: TL.Text -> [Int]
toInts = map read . lines . TL.unpack

main :: IO ()
main = do
  userInput <- TLIO.getContents
  let numbers = toInts userInput
  print (sum numbers)
