module Anagram (..) where

import String
import Dict


detect : String -> List String -> List String
detect word wordList =
  List.filter (isAnagram word) wordList


isAnagram : String -> String -> Bool
isAnagram wordOne wordTwo =
  let
    one =
      String.toLower wordOne

    two =
      String.toLower wordTwo
  in
    if one == two then
      False
    else
      compareWords one two


compareWords : String -> String -> Bool
compareWords one two =
  let
    oneDict =
      stringToCharDict one Dict.empty

    twoDict =
      stringToCharDict two Dict.empty
  in
    -- Can't == Dicts directly
    if Dict.toList oneDict == Dict.toList twoDict then
      True
    else
      False


stringToCharDict : String -> Dict.Dict Char Int -> Dict.Dict Char Int
stringToCharDict inString inDict =
  let
    stringTuple =
      String.uncons inString
  in
    case stringTuple of
      Nothing ->
        inDict

      Just ( char, string ) ->
        if (Dict.member char inDict) then
          stringToCharDict string (Dict.update char incrementEntry inDict)
        else
          stringToCharDict string (Dict.insert char 1 inDict)


incrementEntry : Maybe number -> Maybe number
incrementEntry number =
  case number of
    Nothing ->
      Nothing

    Just value ->
      Just (value + 1)
