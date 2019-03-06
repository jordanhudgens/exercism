class Phrase
  WORDS_REGEX = /\b[\w']+\b/
  private_constant :WORDS_REGEX

  def initialize(word_string)
    @word_string = word_string
  end

  def words
    word_string.scan(WORDS_REGEX)
  end

  def word_count
    words.each_with_object(Hash.new(0)) do |word, hash|
      hash[word.downcase] += 1
    end
  end

  private

  attr_reader :word_string
end
