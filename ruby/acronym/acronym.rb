## Provides the abbreviate class method.
class Acronym
  INITAL_LETTER = /(?: # Exclude first capture group from match
  ^|\s|[[:punct:]])    # start, whitespace charecter, or punctuation
  ([a-zA-Z])           # Capture the next alphabetic numeric charecter.
  /x                   # Allow comments and whitespace in the regex.

  class << self
    def abbreviate(phrase)
      phrase.scan(INITAL_LETTER).join.upcase
    end
  end
end
