# TODO
# system works
# now add error handling
module Grains
  def self.square(num)
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

Grains.square(4)
# 8

Grains.square(16)
# 32_768

Grains.total
