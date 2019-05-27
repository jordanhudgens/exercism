module Pangram
  def self.pangram?(sentence)
    ("a".."z").to_a.each do |letter|
      return false if !sentence.downcase.include?(letter)
    end
    true
  end
end
