Great job!  Excellent use of `scan,` and you found a regex that passes all the tests. This is answer passes all the requirements, but just a couple notes:

Regular expressions are almost always constants, and as such, it is customary in Ruby to name them outside of method definitions, right below the class declaration, then pass that name when calling other methods.

Using the \w special character will also include 'word boundaries' that start with a number or an underscore. This may not be desirable, so you could use something like \b[a-zA-Z]

 
