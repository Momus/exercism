class Pangram

  VERSION = 1
  ALPHABET = ('a'..'z')
  NUMBER_OF_LETTERS_IN_ALPHABET = 26

  def Pangram.is_pangram? str

    counter = 0
    comp_str = str.downcase

    counter = ALPHABET.count { |l| comp_str.include? l }

    counter == NUMBER_OF_LETTERS_IN_ALPHABET
    
  end

  
end
