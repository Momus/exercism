## Provides the abbreviate class method.
class Acronym
  INITIAL_LETTER = /\b[a-zA-Z]/.freeze

  class << self
    def abbreviate(phrase)
      phrase.scan(INITIAL_LETTER).join.upcase
    end
  end
end
