module HelloWorld exposing (..) 

helloWorld : Maybe String -> String
helloWorld greetname =
  case greetname of
    Nothing -> "Hello, World!"
    Maybe.Just name ->  "Hello, " ++ name ++"!"



