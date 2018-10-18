-- From the chapter
type FirstName = String
type LastName = String
type MiddleName = String

data Name = Name FirstName LastName
  | NameWithMiddle FirstName MiddleName LastName
  | TwoInitialsWithLast Char Char LastName
  | FirstNameWithTwoInits FirstName Char Char

data Creator = AuthorCreator Author | ArtistCreator Artist
data Author = Author Name
data Artist = Person Name | Band String

data Book = Book {
                   author :: Creator
                 , isbn :: String
                 , bookTitle :: String
                 , bookYear :: Int
                 , bookPrice :: Double
                 }

data VinylRecord = VinylRecord {
                                 artist :: Creator
                               , recordTitle :: String
                               , recordYear :: Int
                               , recordPrice :: Double
                               }

data CollectibleToy = CollectibleToy {
                                       name :: String
                                     , description :: String
                                     , toyPrice :: String
                                     }

-- Actual additions
data Pamphlet = Pamphlet {
                  title :: String
                , pamphletDesc :: String
                , contact :: String
                }

data StoreItem = BookItem Book
  | RecordItem VinylRecord
  | ToyItem CollectibleToy
  | PamphletItem Pamphlet
