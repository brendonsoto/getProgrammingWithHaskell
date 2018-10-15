data FiveSidedDie = S1 | S2 | S3 | S4 | S5 deriving (Show, Die)

class Die a where
  showDieFace :: a -> String
