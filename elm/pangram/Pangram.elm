module Pangram exposing (..)

import Regex exposing (regex)
import String


isPangram : String -> Bool
isPangram sentence =
    sentence
        |> String.toLower
        |> rgxListFilter alphabetRgx


{-| Test a string to see if it matches each element of a list of
regular expressions. Retrurns true if every member of the list
mathces.
-}
rgxListFilter : List Regex.Regex -> String -> Bool
rgxListFilter rgxList targetString =
    rgxList
        |> List.map
            (targetString
                |> flip Regex.contains
            )
        |> allTrue


allTrue : List Bool -> Bool
allTrue booList =
    if List.member False booList then
        False
    else
        True


rgxList : List String -> List Regex.Regex
rgxList listOfStrings =
    List.map regex listOfStrings


alphabetRgx : List Regex.Regex
alphabetRgx =
    rgxList alphabet


alphabet : List String
alphabet =
    [ "a"
    , "b"
    , "c"
    , "d"
    , "e"
    , "f"
    , "g"
    , "h"
    , "i"
    , "j"
    , "k"
    , "l"
    , "m"
    , "n"
    , "o"
    , "p"
    , "q"
    , "r"
    , "s"
    , "t"
    , "u"
    , "v"
    , "w"
    , "x"
    , "y"
    , "z"
    ]
