class PigLatin
  VOWEL_SOUND = /\A[aeiou]|[xy][^aeiou]/
  CONSONANT = /\A([^aeiou]*qu|[^aeiou]+)([aeiou].*)\z/

  def self.translate(words)
    words.split.map do |word|
      word =~ VOWEL_SOUND ? word + 'ay' : build_word(word)
    end.join(' ')
  end

  def self.build_word(word)
    split = CONSONANT.match(word)
    split[2] + split[1] + 'ay'
  end
end
