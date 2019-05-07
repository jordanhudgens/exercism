class Grains
  def self.square n
    raise ArgumentError unless n.between?(1, 64)
    2 ** (n - 1)
  end

  def self.total
    (1..64)
      .map { |i| self.square(i) }
      .sum
  end
end
