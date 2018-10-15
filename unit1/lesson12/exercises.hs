data Patient = Patient { name :: Name
                       , sex :: Sex
                       , age :: Int
                       , height :: Int
                       , weight :: Int
                       , bloodType :: BloodType }

type FirstName = String
type LastName = String
type MiddleName = String

data Name = Name FirstName LastName
          | NameWithMiddle FirstName MiddleName LastName

data Sex = Male | Female

sexInitial :: Sex -> Char
sexInitial Male = 'M'
sexInitial Female = 'F'

-- BloodType
data RhType = Pos | Neg
data ABOType = A | B | AB | O
data BloodType = BloodType ABOType RhType


-- Ex Q12.1
canDonateTo :: BloodType -> BloodType -> Bool
canDonateTo (BloodType O _) _ = True -- Universal donor
canDonateTo _ (BloodType AB _) = True -- Universal receiver
canDonateTo (BloodType A _) (BloodType A _) = True
canDonateTo (BloodType B _) (BloodType B _) = True
canDonateTo _ _ = False

canDonateTo' :: Patient -> Patient -> Bool
canDonateTo' p1 p2 = canDonateTo (bloodType p1) (bloodType p2)

-- Ex Q12.2
nameToString :: Name -> String
nameToString (Name first last) = first ++ last
nameToString (NameWithMiddle f m l) = f ++ m ++ l

sexToString :: Sex -> String
sexToString Male = "Male"
sexToString Female = "Female"

bloodTypeToString :: BloodType -> String
bloodTypeToString (BloodType abo rh) = aboToString abo ++ rhToString rh

aboToString :: ABOType -> String
aboToString A = "A"
aboToString B = "B"
aboToString AB = "AB"
aboToString O = "O"

rhToString :: RhType -> String
rhToString Pos = "+"
rhToString Neg = "-"

patientSummary :: Patient -> String
patientSummary p = border ++ "\n" ++
                   "Patient Name: " ++ pName ++ "\n" ++
                   "Sex: " ++ pSex ++ "\n" ++
                   "Age: " ++ pAge ++ "\n" ++
                   "Height: " ++ pHeight ++ "in. \n" ++
                   "Weight: " ++ pWeight ++ "lbs. \n" ++
                   "Blood Type: " ++ pBloodType ++ "\n" ++
                   border
  where
    border = replicate 15 '*'
    pName = nameToString (name p)
    pSex = sexToString (sex p)
    pAge = show (age p)
    pHeight = show (height p)
    pWeight = show (weight p)
    pBloodType = bloodTypeToString (bloodType p)
