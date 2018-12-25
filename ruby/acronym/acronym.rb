## Provides the abbreviate class method.
class Acronym
  INITIAL_LETTER = /(?: # exclude first capture group from match
  ^|\s|[[:punct:]])     # string start, white space, or punctuation
  ([a-zA-Z])            # capture the next alphabetic character.
  /x                    # allow comments and white space in regex.

  class << self
    def abbreviate(phrase)
      phrase.scan(INITIAL_LETTER).join.upcase
    end
  end
end
