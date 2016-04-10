module Pangram (..) where

import Regex exposing (regex)
import String


isPangram : String -> Bool
isPangram sentence =
  let
    test_regex_list =
      regexList alphabet

    result_list =
      List.map (flip Regex.contains (String.toLower sentence)) test_regex_list
  in
    if List.member False result_list then
      False
    else
      True


-- AFAIK, there's no way to generate a range of chars in Elm
alphabet : List String
alphabet =
  [ "a", "b", "c", "d", "e", "f", "g", "h", "i"
  , "j", "k", "l", "m", "n", "o", "p", "q", "r"
  , "s", "t", "u", "v", "w", "x", "y", "z"]


--This may already be somewhere in Elm
regexList : List String -> List Regex.Regex
regexList listOfStrings =
  List.map regex listOfStrings
