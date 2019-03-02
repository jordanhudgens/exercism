class Matrix
  def initialize(str)
    @str = str
  end

  def rows
    @str
      .split("\n")
      .map { |el| el.split(" ")
             .map { |nested_el| nested_el.to_i }
      }
  end

  def columns
    # count = rows.count - 1
    # column_array = Array.new(count) { Array.new }
    #
    # count.times do |i|
    #   rows.each { |row| column_array[i].push row[i] }
    # end
    #
    # column_array
    rows.transpose
  end
end


matrix = Matrix.new("1 2 3\n4 5 6\n7 8 9\n 8 7 6")
matrix.columns
