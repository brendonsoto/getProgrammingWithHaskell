ifEven f x = if even x
                 then f x
                 else x

ifEvenInc = ifEven (+1)
ifEvenDouble = ifEven (*2)
ifEvenSquare = ifEven (^2)
