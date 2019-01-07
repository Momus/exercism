require 'benchmark'

## Luhn number validator.
class Luhn
  class << self
    def valid?(number)
      input_valid?(number) && luhn_valid?(luhn_prep(number))
    end

    # Same as `valid?` but with a single iteration through the string
    # `number.`
    def ugly_loop_valid(number)
      luhn_sum = luhn_in_one(number)
      luhn_sum && (luhn_sum % 10).zero?
    end

    private

    def input_valid?(number)
      number !~ /[^\d|\s]/
    end

    def luhn_valid?(numbers)
      numbers.length > 1 && (luhn_sum(numbers) % 10).zero?
    end

    def luhn_prep(number)
      number.scan(/\d/)
    end

    def luhn_sum(numerals)
      sum = 0
      numerals.reverse.each_with_index do |char, index|
        sum += luhn_convert(char, index)
      end
      sum
    end

    def luhn_convert(char, index)
      number = char.to_i
      index.even? ? number : luhn_double(number)
    end

    def luhn_double(number)
      double = number * 2
      double > 9 ? double - 9 : double
    end

    # This method is not used to complete the assignment, but for
    # comparison in execution speed with `valid?` above.
    def luhn_in_one(number)
      index = 1
      second_number = false
      empty_chars = 0
      luhn_sum = 0
      until  index == number.length + 1
        char = number[-index]
        return false if char =~ /[^\d|\s]/
        if char =~ /\s/
          empty_chars += 1
        elsif second_number
          second_number = false
          luhn_sum += luhn_double(char.to_i)
        else
          second_number = true
          luhn_sum += char.to_i
        end
        index += 1
      end
      return false if number.length - empty_chars < 2
      luhn_sum
    end
  end
end

## Benchmark tests
SHORT_NUM = 16 # Digits on a credit card.
SHORT_CC_RUN = 3_000
LONG_CC_RUN = 30_000
CC_TIMES_RUN = 200

BIG_NUM = 500
SUPER_NUM = 5_000
BIG_N_SIZE = 50
BIG_N_TIMES_RUN = 50

STRING_FORMAT = '%010d'.freeze
lots_of_cards = Array.new(SHORT_CC_RUN) { STRING_FORMAT % rand(SHORT_NUM**SHORT_NUM) }
even_more_cards = Array.new(LONG_CC_RUN) { STRING_FORMAT % rand(SHORT_NUM**SHORT_NUM) }
big_big_numbers = Array.new(BIG_N_SIZE) { STRING_FORMAT % rand(BIG_NUM**BIG_NUM) }
even_bigger_numbers = Array.new(BIG_N_SIZE) { STRING_FORMAT % rand(SUPER_NUM**SUPER_NUM) }

prettier_luhn = Benchmark.measure do
  CC_TIMES_RUN.times do
    lots_of_cards.each { |c| Luhn.valid?(c) }
  end
end

puts "Pretty Luhn; size #{SHORT_CC_RUN} Array of #{SHORT_NUM} digit numbers."
puts prettier_luhn

prettier_luhn_even_more_cards = Benchmark.measure do
  CC_TIMES_RUN.times do
    even_more_cards.each { |c| Luhn.valid?(c) }
  end
end

puts "Pretty Luhn, size #{LONG_CC_RUN} Array of #{SHORT_NUM} digit numbers."
puts prettier_luhn_even_more_cards

ugly_luhn = Benchmark.measure do
  CC_TIMES_RUN.times do
    lots_of_cards.each { |c| Luhn.ugly_loop_valid(c) }
  end
end

puts

puts "Ugly Luhn; size #{SHORT_CC_RUN} Array of #{SHORT_NUM} digit numbers."
puts ugly_luhn

ugly_luhn_even_more_cards = Benchmark.measure do
  CC_TIMES_RUN.times do
    even_more_cards.each { |c| Luhn.ugly_loop_valid(c) }
  end
end

puts "Ugly Luhn; size #{LONG_CC_RUN} Array of #{SHORT_NUM} digit numbers."
puts ugly_luhn_even_more_cards

puts '___________________________________________'
puts

prettier_luhn_big_numbers = Benchmark.measure do
  BIG_N_TIMES_RUN.times do
    big_big_numbers.each { |c| Luhn.valid?(c) }
  end
end

puts "Pretty Luhn, size #{BIG_N_SIZE} Array of #{BIG_NUM} digit numbers."
puts prettier_luhn_big_numbers

prettier_luhn_even_bigger_numbers = Benchmark.measure do
  BIG_N_TIMES_RUN.times do
    even_bigger_numbers.each { |c| Luhn.valid?(c) }
  end
end

puts "Pretty Luhn, size #{BIG_N_SIZE} Array of #{SUPER_NUM} digit numbers."
puts prettier_luhn_even_bigger_numbers

big_ugly_luhn = Benchmark.measure do
  BIG_N_TIMES_RUN.times do
    big_big_numbers.each { |c| Luhn.ugly_loop_valid(c) }
  end
end

puts ' '

puts "Ugly Luhn, size #{BIG_N_SIZE} Array of #{BIG_NUM} digit numbers."
puts big_ugly_luhn

big_ugly_luhn_bigger_numbers = Benchmark.measure do
  BIG_N_TIMES_RUN.times do
    even_bigger_numbers.each { |c| Luhn.ugly_loop_valid(c) }
  end
end

puts ' '
puts "Ugly Luhn, size #{BIG_N_SIZE} Array of #{SUPER_NUM} digit numbers."
puts big_ugly_luhn_bigger_numbers

# Pretty Luhn; size 3000 Array of 16 digit numbers.
#   9.340000   0.000000   9.340000 (  9.385303)
# Pretty Luhn, size 30000 Array of 16 digit numbers.
#  93.510000   0.000000  93.510000 ( 93.891593)

# Ugly Luhn; size 3000 Array of 16 digit numbers.
#   9.610000   0.000000   9.610000 (  9.644349)
# Ugly Luhn; size 30000 Array of 16 digit numbers.
#  96.490000   0.000000  96.490000 ( 96.845574)
# ___________________________________________

# Pretty Luhn, size 50 Array of 500 digit numbers.
#   1.790000   0.000000   1.790000 (  1.797839)
# Pretty Luhn, size 50 Array of 5000 digit numbers.
#  25.210000   0.010000  25.220000 ( 25.309859)

# Ugly Luhn, size 50 Array of 500 digit numbers.
#   2.690000   0.000000   2.690000 (  2.699606)

# Ugly Luhn, size 50 Array of 5000 digit numbers.
#  36.210000   0.000000  36.210000 ( 36.342420)
