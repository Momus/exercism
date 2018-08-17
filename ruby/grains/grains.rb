## Counting grains on a chessboard
class Grains
  BOARD_SIZE = 64
  ROYAL_MULTIPLIER = 2
  START_SQUARE = 1
  class << self
    def square(number)
      raise ArgumentError unless number > 0 && number < BOARD_SIZE + 1
      dump_wheat(number)
    end

    def total
      @total ||= begin
                   (START_SQUARE..BOARD_SIZE).reduce do |acc, elem|
                     acc + dump_wheat(elem)
                   end
                 end
    end

    private

    def dump_wheat(square_number)
      ROYAL_MULTIPLIER**(square_number - 1)
    end
  end
end

module BookKeeping
  VERSION = 1
end
