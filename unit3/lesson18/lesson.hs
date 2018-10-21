import qualified Data.Map as Map
import qualified Data.List as List

data Box a = Box a deriving Show

wrap :: a -> Box a
wrap x = Box x

unwrap :: Box a -> a
unwrap (Box x) = x


data Triple a = Triple a a a deriving Show

first :: Triple a -> a
first (Triple x _ _) = x

second :: Triple a -> a
second (Triple _ x _) = x

third :: Triple a -> a
third (Triple _ _ x) = x

toList :: Triple a -> [a]
toList (Triple x y z) = [x,y,z]

transform :: (a -> a) -> Triple a -> Triple a
transform f (Triple x y z) = Triple (f x) (f y) (f z)


data List a = Empty | Cons a (List a) deriving Show

ourMap :: (a -> b) -> List a -> List b
ourMap _ Empty = Empty
ourMap func (Cons a rest) = Cons (func a) (ourMap func rest)

-- Modified for Q18.2
data Organ = Heart | Brain | Kidney | Spleen deriving (Show, Eq, Ord) -- Order being the order the types are defined

organs :: [Organ]
organs = [Heart, Heart, Brain, Spleen, Spleen, Kidney]

ids :: [Int]
ids = [2,7,13,14,21,24]

organPairs :: [(Int, Organ)]
organPairs = zip ids organs

organCatalog :: Map.Map Int Organ
organCatalog = Map.fromList organPairs


-- Q18.1
tripleMap :: (a -> b) -> [Triple a] -> [Triple b]
tripleMap f ts = map (\(Triple x y z) -> Triple (f x) (f y) (f z)) ts

boxMap :: (a -> b) -> [Box a] -> [Box b]
boxMap f bs = map (\(Box x) -> Box (f x)) bs

-- Q18.2
-- I feel like I'm overdoing it... I imported Data.List and am using set and sort functions to solve this
organKeys :: [Organ]
organKeys = List.sort . List.nub $ organs

organValues :: [Int]
organValues = map length . List.group . List.sort $ organs

organInventory :: Map.Map Organ Int
organInventory = Map.fromList $ zip organKeys organValues
