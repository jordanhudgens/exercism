class Scrabble
  def initialize letters
    @letters = letters
  end

  def score
    return 0 if @letters.nil?
    letters_as_array.inject(0) do |total, letter|
      total += score_mapper letter
    end
  end

  private

  def letters_without_whitespace
    @letters.strip.gsub(/\s+/, " ")
  end

  def letters_as_array
    letters_without_whitespace.upcase.split("")
  end

  def score_mapper letter
    case letter
    when ""
      0
    when "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"
      1
    when "D", "G"
      2
    when "B", "C", "M", "P"
      3
    when "F", "H", "V", "W", "Y"
      4
    when "K"
      5
    when "J", "X"
      8
    when "Q", "Z"
      10
    end
  end
end

Scrabble.new('quirky').score
