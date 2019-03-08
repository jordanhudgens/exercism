module Hamming
  def self.compute(str1, str2)
    raise ArgumentError if str1.length != str2.length

    str1_as_array = str1.split("")
    str2_as_array = str2.split("")

    str1_as_array.each_with_index.inject(0) do |total, (char, index)|
      if char != str2_as_array[index]
        total += 1
      end
      total
    end
  end
end
