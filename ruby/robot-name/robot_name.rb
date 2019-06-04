require 'set'

$numbers = ("000".."999").cycle(676).to_a
$letters = ("AA".."ZZ").cycle(1000).to_a
$names = []

x = Set.new # => #<Set: {}>

x.add?("asdf") # => #<Set: {"asdf"}>
x.add?("zxcv") # => #<Set: {"asdf", "zxcv"}>
x.add?("asdf") # => nil

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
# Build out loop and try to add? to the set
# with the cycle of AA and ZZ combined with a randomized form of 0-9 for the other three

# all_names_count = 26 * 26 * 1000
# seen_names = Hash.new(0)
# robots = []
# while seen_names.size < all_names_count
#   robot = Robot.new
#   puts "NAME: #{robot.name}, ALL COUNT: #{robots.size}, SEEN COUNT: #{seen_names.size}"
#   seen_names[robot.name] += 1
#   robots << robot
# end
#
# all_names_count
# robots.size
# assert seen_names.values.all? { |count| count == 1 }, "Some names used more than once"
# assert seen_names.keys.all? { |name| name.match(NAME_REGEXP) }, "Not all names match #{NAME_REGEXP}"
