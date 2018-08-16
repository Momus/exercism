# One for you, one for me!
class TwoFer
  class << self
    def two_fer(name = 'you')
      "One for #{name}, one for me."
    end
  end
end

module BookKeeping
  VERSION = 1
end
