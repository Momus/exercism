class Pangram

  VERSION = 1
  ALPHABET = ('a'..'z')

  def Pangram.is_pangram? str

    comp_str = str.downcase

    ALPHABET.all? { |l| comp_str.include? l }
    
  end

  
end
