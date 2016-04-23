module SumOfMultiples (..) where


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples multipleList maxValue =
  sOfMList multipleList [1..(maxValue - 1)] []
    |> List.sum


sOfMList : List Int -> List Int -> List Int -> List Int
sOfMList multipleList maxValueList outList =
  --Produce a list of numbers containing each number on an input list
  --that is a multiple of a number on the multiples list.
  let
    carMaxValue =
      List.head maxValueList

    cdrMaxValue =
      case (List.tail maxValueList) of
        Nothing ->
          []

        Just cdrList ->
          cdrList
  in
    case carMaxValue of
      Nothing ->
        outList

      Just nextInt ->
        let
          newOutList =
            if
              (multipleList
                |> List.filter (isMultiple nextInt)
              )
                == []
            then
              outList
            else
              nextInt :: outList
        in
          newOutList
            |> sOfMList multipleList cdrMaxValue


isMultiple : Int -> Int -> Bool
isMultiple big small =
  if ((big `rem` small) == 0) then
    True
  else
    False
