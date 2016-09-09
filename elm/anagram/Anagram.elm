module Anagram exposing (..)

{-| Given: a word in the form of a string, and a list of strings
Return: a sublist whose elemenst are anagrams of the input worldq
-}

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

        oneDict =
            stringToCharDict one Dict.empty

        twoDict =
            stringToCharDict two Dict.empty
    in
        -- a word is not an anagram of itself
        if one == two then
            False
            -- can't == Dicts directly; compare lists of tuples
        else if Dict.toList oneDict == Dict.toList twoDict then
            True
        else
            False


{-| Given a string, creates a Dict consisting of all the charecters in
   the string mapped to the number of times each charecter occurs in the
   string. Call with an empty Dict to start the tail wagging.

   stringToCharDict "Jeremy Irons" Dict.empty == Dict.fromList
   [('',1),('I',1),('J',1),('e',2),('m',1),('n',1),('o',1),('r',2),('s',1),('y',1)]
   : Dict.Dict Char Int
-}
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


{-| Basically, (Maybe number)++
-}
incrementEntry : Maybe number -> Maybe number
incrementEntry number =
    case number of
        Nothing ->
            Nothing

        Just value ->
            Just (value + 1)
