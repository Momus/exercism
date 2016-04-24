module Hamming (..) where

import String


distance : String -> String -> Maybe Int
distance strandA strandB =
  if String.length strandA == String.length strandB then
    let
      {- String only has a map not a map2 or map3.
      But I don't think converting to a list is
      computationally expenisve.
      -}
      listA =
        String.toList strandA

      listB =
        String.toList strandB

      mismatch a b =
        if a == b then
          0
        else
          1
    in
      Just
        <| List.sum
        <| List.map2 mismatch listA listB
  else
    Nothing
