class Anagram
  def initialize(input)
    @input = input.downcase
  end

  def match(words_arr)
    words_arr.select { |word| anagrams?(word.downcase)}
  end

  def anagrams?(word)
    word != @input &&
    word.downcase.split(//).sort.eql?(@input.split(//).sort)
  end
end
