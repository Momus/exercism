module Strain exposing (..) 

import List


keep : (a -> Bool) -> List a -> List a
keep f list =
  myFilter True f list []


discard : (a -> Bool) -> List a -> List a
discard f list =
  myFilter False f list []


myFilter : Bool -> (a -> Bool) -> List a -> List a -> List a
myFilter isKeep f listIn listOut =
  case listIn of
    [] ->
      listOut

    first :: rest ->
      case isKeep of
        True ->
          if f first then
            first
              :: []
              |> List.append listOut
              |> myFilter True f rest
          else
            myFilter True f rest listOut

        False ->
          if f first then
            myFilter False f rest listOut
          else
            first
              :: []
              |> List.append listOut
              |> myFilter False f rest
