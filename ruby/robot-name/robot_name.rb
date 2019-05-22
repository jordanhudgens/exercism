require 'date'

$names = []

class Robot
  attr_accessor :name

  def initialize
    @name = name_builder
  end

  def name_builder
    unique = false

    until unique do
      temp_name = run_name_generator

      # TODO
      # put a counter here to see if this is getting run too many times
      # it needs to be around 14 times faster
      if !$names.include?(temp_name)
        $names << temp_name
        unique = true
      end
    end

    $names.last
  end

  def run_name_generator
    two_letters = ("A".."Z").to_a.sample(2).join("")
    three_numbers = (1..9).to_a.sample(3).join("")
    two_letters << three_numbers
  end

  def self.forget
  end

  def reset
    @name = name_builder
  end
end
