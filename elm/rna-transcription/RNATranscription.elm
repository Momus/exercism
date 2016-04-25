module RNATranscription (..) where

import Dict
import String exposing (append, uncons, fromChar)


toRNA : String -> Result Char String
toRNA dnaSequence =
  getComplement dnaSequence dnaCompDict ""


getComplement : String -> Dict.Dict Char Char -> String -> Result Char String
getComplement strand nucleotideDict outStrand =
  case String.uncons strand of
    Nothing ->
      Ok outStrand

    Just ( n, rest ) ->
      let
        complement =
          nucleotideDict
            |> Dict.get n
      in
        case complement of
          Nothing ->
            Err n

          Just comp ->
            comp
              |> String.fromChar
              |> append outStrand
              |> getComplement rest nucleotideDict


dnaCompDict : Dict.Dict Char Char
dnaCompDict =
  Dict.fromList
    [ ( 'G', 'C' )
    , ( 'C', 'G' )
    , ( 'T', 'A' )
    , ( 'A', 'U' )
    ]
