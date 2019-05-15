require 'date'

class Robot
  attr_accessor :name

  def initialize
    @name = name_generator
  end

  def name_generator
    two_letters = ("A".."Z").to_a.sample(2).join("")
    three_numbers = random_numbers
    two_letters << three_numbers
  end

  def random_numbers
    DateTime.now.strftime('%Q').split("").last(3).join("")
  end

  def self.forget
    # TODO
  end

  def reset
    @name = name_generator
  end
end

# TODO
# save robot names in a file
# then check through file to ensure name hasn't been used
#

Robot.new.name # => "UI502"
Robot.new.name # => "GL502"

