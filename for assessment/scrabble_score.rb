class Scrabble
  LETTER_VALUES = {1 => ['a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't'],
                   2 => ['d', 'g'], 3 => ['b', 'c', 'm', 'p'],
                   4 => ['f', 'h', 'v', 'w', 'y'], 5 => ['k'], 8 => ['j', 'x'],
                   10 => ['q', 'z']}.freeze

  def initialize(word)
    @word = word
  end

  def self.score(word)
    return 0 if word.nil? || word.empty?

    accumulator = 0
    word.downcase.each_char do |char|
      LETTER_VALUES.each { |k,v| accumulator += k.to_i if v.include?(char) }
    end
    accumulator
  end

  def score
    self.class.score(@word)
  end
end
