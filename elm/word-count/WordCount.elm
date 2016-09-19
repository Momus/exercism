module WordCount exposing (..) 

import String exposing (fromChar)
import Dict
import Regex exposing (regex)


type alias CountDict =
  Dict.Dict String Int


wordCount : String -> CountDict
wordCount phrase =
  wCount phrase "" Dict.empty


wCount : String -> String -> CountDict -> CountDict
wCount phrase nextWord outDict =
  let
    phraseTuple =
      phrase
        |> String.toLower
        |> String.uncons
  in
    case phraseTuple of
      Nothing ->
        if nextWord == "" then
          outDict
        else if Dict.member nextWord outDict then
          Dict.update nextWord incrementEntry outDict
        else
          Dict.insert nextWord 1 outDict

      Just ( firstChar, restString ) ->
        case isGoodChar firstChar of
          True ->
            let
              nextWord =
                firstChar
                  |> fromChar
                  |> String.append nextWord
            in
              wCount restString nextWord outDict

          False ->
            let
              isEmptyWord =
                (nextWord == "")
            in
              case isEmptyWord of
                True ->
                  wCount restString "" outDict

                False ->
                  if Dict.member nextWord outDict then
                    wCount restString "" (Dict.update nextWord incrementEntry outDict)
                  else
                    wCount restString "" (Dict.insert nextWord 1 outDict)


isGoodChar : Char -> Bool
isGoodChar test_c =
  let
    goodCharRegex =
      "[a-z]|[0-9]"
        |> regex
  in
    test_c
      |> fromChar
      |> Regex.contains goodCharRegex


incrementEntry : Maybe number -> Maybe number
incrementEntry number =
  case number of
    Nothing ->
      Nothing

    Just value ->
      Just (value + 1)
