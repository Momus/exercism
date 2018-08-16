## Counting grains on a chessboard
class Grains
  class << self
    def square(n)
      raise ArgumentError unless n > 0 && n < 65
      2**(n - 1)
    end

    def total
      ## Caching 18_446_744_073_709_551_615 is faster! But...
      (1..64).reduce { |acc, elem| acc + 2**(elem - 1) }
    end
  end
end

module BookKeeping
  VERSION = 1
end
