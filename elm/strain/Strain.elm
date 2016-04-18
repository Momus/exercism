module Strain (..) where

import List


keep : (a -> Bool) -> List a -> List a
keep function list =
  myFilter True function list []


discard : (a -> Bool) -> List a -> List a
discard function list =
  myFilter False function list []


myFilter : Bool -> (a -> Bool) -> List a -> List a -> List a
myFilter isKeep function listIn listOut =
  case listIn of
    [] ->
      listOut

    first :: rest ->
      case isKeep of
        True ->
          if function first then
            first
              :: []
              |> List.append listOut
              |> myFilter True function rest
          else
            myFilter True function rest listOut

        False ->
          if function first then
            myFilter False function rest listOut
          else
            first
              :: []
              |> List.append listOut
              |> myFilter False function rest
