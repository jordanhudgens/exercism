$numbers = ("000".."999").to_a
$letters = ("AA".."ZZ").to_a
$names = []

class Robot
  attr_accessor :name

  def initialize
    @name = name_builder
  end

  def name_builder
    # TODO
    # Need to get through the numbers before going through the letters
    generated_name = $letters.shift + $numbers.shift
    $names << generated_name
    generated_name
  end

  def self.forget
    $names = []
  end

  def reset
    initialize
  end
end
