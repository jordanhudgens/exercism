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


# TODO
# Run this code before starting:
# The all_names_count goes up to 675999 when it errors out
# The seen_names stops about halfway through the run at 169000 and then stops incrementing
all_names_count = 26 * 26 * 1000
seen_names = Hash.new(0)
robots = []
while seen_names.size < all_names_count
  robot = Robot.new
  puts "NAME: #{robot.name}, ALL COUNT: #{robots.size}, SEEN COUNT: #{seen_names.size}"
  seen_names[robot.name] += 1
  robots << robot
end

all_names_count
robots.size
# assert seen_names.values.all? { |count| count == 1 }, "Some names used more than once"
# assert seen_names.keys.all? { |name| name.match(NAME_REGEXP) }, "Not all names match #{NAME_REGEXP}"
