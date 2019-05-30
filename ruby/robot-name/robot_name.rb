$numbers = ("000".."999").cycle(676).to_a
$letters = ("AA".."ZZ").cycle(1000).to_a
$names = []

# TODO
# all tests are passing except the last one.
# Bring in that code and see at what spot it's failing

class Robot
  attr_accessor :name

  def initialize
    @name = name_builder
  end

  def name_builder
    generated_name = $letters.shift + $numbers.shift

    $names << generated_name
    generated_name
  end

  def self.forget
    $names = []
    $numbers = ("000".."999").cycle(676).to_a
    $letters = ("AA".."ZZ").cycle(1000).to_a
  end

  def reset
    initialize
  end
end
