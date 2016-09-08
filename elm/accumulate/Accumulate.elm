module Accumulate exposing (accumulate)

{-| Given a function and a list, accumulate returns a new list in
which each element is created by the application of the function to
the corresponding element of the input list.
-}


accumulate : (a -> b) -> List a -> List b
accumulate inFunction listIn =
    my_map inFunction listIn []


{-| This is the tail-recursive funcion which the accumulate function
calls with an empty list
-}
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
