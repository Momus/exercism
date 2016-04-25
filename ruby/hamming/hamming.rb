
class Hamming

  VERSION = 1

  def self.compute(first_sequence, second_sequence)

    valid? first_sequence, second_sequence
    
    first_chars = first_sequence.chars
    second_chars = second_sequence.chars

    first_chars.count.each_index { |n|  first_sequence[n] != second_sequence[n] }

  end

  private
  
  def self.valid? str1, str2
    raise ArgumentError if str1.length != str2.length
  end
  
end 
