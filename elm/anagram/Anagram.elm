module Anagram (..) where



detect : String -> List String -> List String
detect word wordList =
  List.filter (isAnagram word) wordList

      
isAnagram : String -> String -> Bool
isAnagram wordOne wordTwo =
  if wordOne == wordTwo then True
  else False

      

      
-- isAnagram -> String -> 


-- stringToCharDict : String -> Dict.Dict String Int
-- stringToCharDict string =
--   let
--     outDict = Dict.empty
--   in
--     case string of
--       String.isEmpty  ->
--         outstring





incrementEntry : Maybe number -> Maybe number     
incrementEntry charecter  =
  case charecter of
    Nothing -> Nothing
    Just value -> Just (value + 1)
