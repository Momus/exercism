module Pangram exposing (..)

import Regex exposing (regex)
import String


isPangram : String -> Bool
isPangram sentence =
    alphabet
        |> regexList
        |> rgxListFilter (String.toLower sentence)
        |> allTrue


regexList : List String -> List Regex.Regex
regexList listOfStrings =
    List.map regex listOfStrings


rgxListFilter : String -> List Regex.Regex -> List Bool
rgxListFilter targetString regexList =
    regexList
        |> List.map
            (targetString
                |> flip Regex.contains
            )


allTrue : List Bool -> Bool
allTrue booList =
    if List.member False booList then
        False
    else
        True


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
