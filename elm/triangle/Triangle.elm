module Triangle exposing (..)

{-| Given: three numbers representing side lengths Determine if they
can belong to a valid triangle. If they can return a Triangle type of
the approporate kind. If not, return an error and a string explaining
how the given inputs violate allowable length of triagle sides.

triangleKind 2 2 4  == Ok Scaline
triangleKind 1.0 0 0.3 == Err "Invalid lengths"

-}

import Result exposing (..)


version : Int
version =
    2


type Triangle
    = Equilateral
    | Isosceles
    | Scalene


triangleKind : number -> number -> number -> Result String Triangle
triangleKind a b c =
    if ((a <= 0) || (b <= 0) || (c <= 0)) then
        Err "Invalid lengths"
    else if (2 * (max a (max b c))) >= (a + (b + c)) then
        Err "Violates inequality"
    else if ((a == b) && (b == c)) then
        Ok Equilateral
    else if ((a == b) || (a == c) || (b == c)) then
        Ok Isosceles
    else
        Ok Scalene
