require 'date'  # => true

class Robot
  attr_accessor :name  # => nil

  def initialize
    @name = name_generator  # => 5, 5
  end                       # => :initialize

  def name_generator
    two_letters = ("A".."Z").to_a.sample(2).join("")    # => "SL",    "SF"
    three_numbers = random_numbers                      # => "222",   "228"
    name = two_letters << three_numbers                 # => "SL222", "SF228"
    # get file reader working
    File.open("ruby/robot-name/names.txt", 'a') do |f|  # => File, File
      f.write(name)                                     # => 5,    5
    end                                                 # => 5,    5
  end                                                   # => :name_generator

  def random_numbers
    DateTime.now.strftime('%Q').split("").last(3).join("")  # => "222", "228"
  end                                                       # => :random_numbers

  def self.forget
    # TODO
  end              # => :forget

  def reset
    @name = name_generator
  end                       # => :reset
end                         # => :reset

Robot.new.name  # => 5
Robot.new.name  # => 5

