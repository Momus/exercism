module DifferenceOfSquares exposing (squareOfSum, sumOfSquares, difference)


squareOfSum : Int -> Int
squareOfSum n =
    [1..n]
        |> List.sum
        |> square


sumOfSquares : Int -> Int
sumOfSquares n =
    [1..n]
        |> List.map square
        |> List.sum


difference : Int -> Int
difference n =
    (squareOfSum n) - (sumOfSquares n)


square : number -> number
square x =
    ((^) x 2)
