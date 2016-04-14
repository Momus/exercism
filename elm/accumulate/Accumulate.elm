module Accumulate (..) where


accumulate : (a -> b) -> List a -> List b
accumulate inFunction listIn  =
  --  This line alone passes all tests: List.map function listIn
  my_map inFunction listIn []

my_map : (a -> b) -> List a -> List b -> List b
my_map function inList outList =
  case inList of
    [] ->
      outList
        
    first :: rest ->
      let
        nextAdd =
          function(first) :: []
                  
        newList =
          List.append outList nextAdd
      in
        my_map function rest newList
            

{--
   
This compiles, however, when I run the tests, I get a Node.js error:
----------------------------------------------------------
  accumulate $ elm-test AccumulateTests.elm 
Success! Compiled 1 modules.
Successfully generated /tmp/elm_test_116311-2502-1yl1rbp.js
Successfully compiled AccumulateTests.elm
Running tests...
[stdin]:9070
               function = _v1;
                        ^

SyntaxError: Unexpected token =
    at Object.exports.runInThisContext (vm.js:53:16)
    at Object.<anonymous> ([stdin]-wrapper:6:22)
    at Module._compile (module.js:409:26)
    at node.js:579:27
    at nextTickCallbackWith0Args (node.js:420:9)
    at process._tickCallback (node.js:349:13)
----------------------------------------------------------
Did I just break Elm?

Any hints would be greatly appreciated.
       

--}
