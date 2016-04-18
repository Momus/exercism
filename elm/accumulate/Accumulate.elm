module Accumulate (..) where


accumulate : (a -> b) -> List a -> List b
accumulate inFunction listIn =
  my_map inFunction listIn []


my_map : (a -> b) -> List a -> List b -> List b
my_map f inList outList =
  case inList of
    [] ->
      outList

    first :: rest ->
      f first
        :: []
        |> List.append outList
        |> my_map f rest
