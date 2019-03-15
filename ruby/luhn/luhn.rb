module Luhn
  def self.valid? str
    formatted_str = str.gsub(" ", "")
    return false if formatted_str.length <= 1

    if formatted_str.scan(/\D/).empty?
      reversed_num_arr = formatted_str.split('').reverse

      luhn_algorithm_computation = reversed_num_arr.map.each_with_index do |num, idx|
        if idx.odd?
          product = Integer(num) * 2
          if product > 9
            product - 9
          else
            product
          end
        else
          Integer(num)
        end
      end

      luhn_algorithm_computation.inject(&:+) % 10 == 0 ? true : false
    else
      false
    end
  end
end
