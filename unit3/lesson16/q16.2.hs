data Shape = Circle | Square | Rectangle

myPi :: Double
myPi = 3.14

getPerimeter :: Shape -> Double -> Double -> Double
getPerimeter Circle radius _ = myPi * radius^2
getPerimeter Square side _ = side * 4
getPerimeter Rectangle sideA sideB = 2 * sideA + 2 * sideB

getArea :: Shape -> Double -> Double -> Double
getArea Circle r d = myPi * r * d
getArea Square side _ = side * side
getArea Rectangle sideA sideB = sideA * sideB


{-
  Reflections upon checking the book:
  The book's solution included the other variables needed for the shapes.
  i.e. Circle Radius | Square Side | Rect Height Width
  where Radius/Side/Height/Width were all type synonyms
  That would've made creating the perimeter + area functions a whole lot easier
  I wouldn't have worried about parameters as I did and instead just use what came with the type
-}
