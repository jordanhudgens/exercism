class Phrase
  def initialize strOfWords
    @strOfWords = strOfWords
  end

  def word_count
    str_with_punctuation_removed = @strOfWords.downcase.gsub(/[^[:word:]|'\s]/, ' ')
    words_array = str_with_punctuation_removed.split(" ")
    words_array.each_with_object({}) do |word, hash|
      if hash[word]
        hash[word] = hash[word] + 1
      else
        hash[word] = 1
      end
    end
  end
end
