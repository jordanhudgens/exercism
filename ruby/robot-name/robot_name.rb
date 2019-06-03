$numbers = ("000".."999").cycle(676).to_a
$letters = ("AA".."ZZ").cycle(1000).to_a
$names = []

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
# The issue is that we're missing numbers. Right now it goes 000-999 in order
# But that's missing expected combinations, e.g. 831, 638, etc.
# Maybe try to not cycle through the range, but add randomizer for numbers only
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
