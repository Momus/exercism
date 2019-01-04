## Test to see if a word is an isogram
class Isogram
  def self.isogram?(word)
    letters = word.upcase.scan(/\w/)
    letters.uniq == letters
  end
end
