## Counting grains on a chessboard
class Grains
  BOARD_SIZE = 64
  ROYAL_MULTIPLIER = 2
  START_SQUARE = 1
  class << self
    def square(number)
      raise ArgumentError unless number > 0 && number < BOARD_SIZE + 1
      ROYAL_MULTIPLIER**(number - 1)
    end

    def total
      @total ||= begin
                   (START_SQUARE..BOARD_SIZE).reduce do |acc, elem|
                     acc + ROYAL_MULTIPLIER**(elem - 1)
                   end
                 end
    end
  end
end

module BookKeeping
  VERSION = 1
end
