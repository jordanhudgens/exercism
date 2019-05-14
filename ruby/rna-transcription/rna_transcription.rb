module Complement
  def self.of_dna(str)
    return "" if str == ""

    str
      .split("")
      .map { |char| Complement.dna_mapper(char) }
      .join("")
  end

  def self.dna_mapper(letter)
    letter_mapping = {
      "G" => "C",
      "C" => "G",
      "T" => "A",
      "A" => "U"
    }

    letter_mapping[letter]
  end
end
