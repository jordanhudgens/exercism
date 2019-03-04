class Series
  def initialize str
    @str = str
  end

  def slices num
    raise ArgumentError if num > @str.length
    arr = @str.split("")
    (arr.size).times.map do |el|
      if arr.size >= num
        val = arr.first(num)
        arr.shift
        val.join("")
      end
    end.compact
  end
end
