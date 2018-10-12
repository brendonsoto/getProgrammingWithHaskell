-- sumSquareOrSquareSUm x y = if sumSquare > squareSum
--                               then sumSquare
--                               else squareSum
--   where sumSquare = x^2 + y^2
--         squareSum = (x+y)^2

-- sumSquareOrSquareSUm x y = body (x^2 + y^2) ((x+y)^2)

-- body sumSquare squareSum = if sumSquare > squareSum
--                               then sumSquare
--                               else squareSum

sumSquareOrSquareSUm x y = (\sumSquare squareSum ->
                             if sumSquare > squareSum
                                then sumSquare
                                else squareSum) (x^2 + y^2) ((x+y)^2)
