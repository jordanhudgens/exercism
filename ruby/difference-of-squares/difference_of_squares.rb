# The square of the sum of the first ten natural numbers is (1 + 2 + ... + 10)² = 55² = 3025.
#
# The sum of the squares of the first ten natural numbers is 1² + 2² + ... + 10² = 385.
#
# Hence the difference between the square of the sum of the first ten natural numbers and the sum of the squares of the first ten natural numbers is 3025 - 385 = 2640.
#

class Squares
  def initialize(num)
    @num = num
  end

  def difference
    square_of_sum - sum_of_squares
  end

  def square_of_sum
    generated_range.inject(&:+) ** 2
  end

  def sum_of_squares
    generated_range.map { |num| num ** 2 }.inject(&:+)
  end

  def generated_range
    (1..@num).to_a
  end
end
