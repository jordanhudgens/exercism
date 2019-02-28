module Acronym
  def self.abbreviate(str)
    str
      .upcase
      .gsub('-', ' ')
      .gsub(/[^A-Z0-9\s]/i, '')
      .split(" ")
      .map { |word| word[0] }
      .join
  end
end
