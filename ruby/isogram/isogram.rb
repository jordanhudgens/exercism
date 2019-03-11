module Isogram
  def self.isogram? input
    input.downcase!
    input.gsub!("-", "")
    input.gsub!(" ", "")
    is_isogram = true
    input.split("").each_with_object({}) do |char, hash|
      if hash[char]
        is_isogram = false
        break
      else
        hash[char] = 1
      end
    end

    is_isogram
  end
end
