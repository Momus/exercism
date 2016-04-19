class Pangram

  VERSION = 1
  ALPHABET = ('a'..'z').to_a
  NUMBER_OF_LETTERS_IN_ALPHABET = 26

  def Pangram.is_pangram? str

    counter = 0
    str.downcase!

    ALPHABET.each { |e| if str.include? e then (counter += 1) end }

    counter == NUMBER_OF_LETTERS_IN_ALPHABET ? true :  false

    
  end

  
end
