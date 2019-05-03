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
