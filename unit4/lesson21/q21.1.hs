import qualified Data.Map as Map

helloPerson :: String -> String
helloPerson name = "Hello" ++ " " ++ name ++ "!"

names :: Map.Map Int String
names = Map.fromList [(0,"Bor"),(1,"Kod")]

maybeMain :: Maybe String
maybeMain = do
  name <- Map.lookup 0 names
  let statement = helloPerson name
  return statement
