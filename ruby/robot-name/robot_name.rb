require 'date'  # => true

class Robot
  attr_accessor :name  # => nil

  def initialize
    @name = name_generator  # => nil, nil
  end                       # => :initialize

  def name_generator
    two_letters = ("A".."Z").to_a.sample(2).join("")  # => "ZQ",              "UL"
    three_numbers = random_numbers                    # => "379",             "379"
    name = two_letters << three_numbers               # => "ZQ379",           "UL379"
    # get file reader working
    f = File.open("names.txt", 'a')                   # => #<File:names.txt>, #<File:names.txt>
    f.puts(name)                                      # => nil,               nil
    f.close                                           # => nil,               nil
  end                                                 # => :name_generator

  def random_numbers
    DateTime.now.strftime('%Q').split("").last(3).join("")  # => "379", "379"
  end                                                       # => :random_numbers

  def self.forget
    # TODO
  end              # => :forget

  def reset
    @name = name_generator
  end                       # => :reset
end                         # => :reset

Robot.new.name  # => nil
Robot.new.name  # => nil

