module Grains
  def self.square(num)
    raise ArgumentError if (num <= 0) || (num > 64)
    return 1 if num == 1
    self.doubler(num)
  end

  def self.doubler(num)
    (1..(num - 1)).to_a.inject(0) do |sum, el|
      if sum == 0
        sum += 2
      else
        sum = sum * 2
      end
    end
  end

  def self.total
    (1..64).to_a.inject(1) do |sum, el|
      sum += self.doubler(el)
    end
  end
end

