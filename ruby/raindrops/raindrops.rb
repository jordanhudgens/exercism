module Raindrops
  def self.convert num
    raindrop_string = [3, 5, 7].inject("") do |acc, i|
      if self.divisors_of(num).include?(i)
        if i == 3
          acc << "Pling"
        elsif i == 5
          acc << "Plang"
        else
          acc << "Plong"
        end
      else
        acc << ""
      end
    end

    if raindrop_string == ""
      raindrop_string = String(num)
    end

    raindrop_string
  end

  def self.divisors_of num
    (1..num).select { |n| num % n == 0 }
  end
end
