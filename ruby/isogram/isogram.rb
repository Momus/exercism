## Test to see if a word is an isogram
class Isogram
  def self.isogram?(word)
    word_array = word.upcase.scan(/\w/)
    word_array.uniq.length == word_array.length
  end
end
