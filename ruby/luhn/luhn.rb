## Luhn number validator.
class Luhn
  class << self
    def valid?(number)
      !number.match(/[^\d|\s]/) && luhn_valid?(number)
    end

    private

    def luhn_valid?(number)
      luhn_sum = 0
      numerals = number.scan(/\d/)
      return false unless numerals.length > 1
      numerals.reverse.each_with_index do |char, index|
        luhn_sum += (index.even? ? char.to_i : luhn_double(char))
      end
      (luhn_sum % 10).zero?
    end

    def luhn_double(numeral)
      number = numeral.to_i * 2
      number > 9 ? number - 9 : number
    end
  end
end
