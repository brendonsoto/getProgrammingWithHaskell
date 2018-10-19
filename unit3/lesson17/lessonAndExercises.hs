-- Originally this was for the lesson, but it evolved to include the exercises too
data Color = Red
           | Yellow
           | Blue
           | Green
           | Purple
           | Orange
           | Brown 
           | White deriving (Show, Eq)

instance Semigroup Color where
  (<>) White _ = White
  (<>) _ White = White
  (<>) Red Blue = Purple
  (<>) Blue Red = Purple
  (<>) Yellow Blue = Green
  (<>) Blue Yellow = Green
  (<>) Yellow Red = Orange
  (<>) Red Yellow = Orange
  (<>) a b | a == b = a
    | all (`elem` [Red, Blue, Purple]) [a,b] = Purple
    | all (`elem` [Blue, Yellow, Green]) [a,b] = Green
    | all (`elem` [Red, Yellow, Orange]) [a,b] = Orange
    | otherwise = Brown

-- Q17.1
instance Monoid Color where
  mempty = White
  mappend = (<>)

-- Events & Probs from Q17.2
newtype Events = Events [String] 

instance Semigroup Events where
  (<>) e1 (Events []) = e1
  (<>) (Events []) e2 = e2
  (<>) (Events e1) (Events e2) = Events (cartCombine combiner e1 e2)
    where combiner x y = mconcat [x,"-",y]

instance Monoid Events where
  mempty = Events []
  mappend = (<>)

newtype Probs = Probs [Double]

instance Semigroup Probs where
  (<>) p1 (Probs []) = p1
  (<>) (Probs []) p2 = p2
  (<>) (Probs p1) (Probs p2) = Probs (cartCombine (*) p1 p2)

instance Monoid Probs where
  mempty = Probs []
  mappend = (<>)


-- Rest of code from lesson
data PTable = PTable Events Probs

createPTable :: Events -> Probs -> PTable
createPTable events (Probs probs) = PTable events (Probs normalizedProbs)
  where totalProbs = sum probs
        normalizedProbs = map (\x -> x/totalProbs) probs

showPair :: String -> Double -> String
showPair event prob = mconcat [event,"|",show prob,"\n"]

instance Show PTable where
  show (PTable (Events events) (Probs probs)) = mconcat pairs
    where pairs = zipWith showPair events probs

cartCombine :: (a -> b -> c) -> [a] -> [b] -> [c]
cartCombine func l1 l2 = zipWith func newL1 cycledL2
  where nToAdd = length l2
        repeatedL1 = map (take nToAdd . repeat) l1
        newL1 = mconcat repeatedL1
        cycledL2 = cycle l2

instance Semigroup PTable where
  (<>) ptable1 (PTable (Events []) (Probs [])) = ptable1
  (<>) (PTable (Events []) (Probs [])) ptable2 = ptable2
  (<>) (PTable e1 p1) (PTable e2 p2) = createPTable newEvents newProbs
    where newEvents = e1 <> e2
          newProbs = p1 <> p2

instance Monoid PTable where
  mempty = PTable (Events []) (Probs [])
  mappend = (<>)

coin :: PTable
coin = createPTable (Events ["heads","tails"]) (Probs [0.5,0.5])

spinner :: PTable
spinner = createPTable (Events ["red","blue","green"]) (Probs [0.1,0.2,0.7])
