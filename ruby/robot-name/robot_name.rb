require 'date'

class Robot
  attr_accessor :name

  def initialize
    @name = name_builder
  end

  def name_builder
    unique = false

    until unique do
      temp_name = run_name_generator

      if !stored_names.include?(temp_name)
        add_to_file(temp_name)
        unique = true
      end
    end

    stored_names.last
  end

  def run_name_generator
    two_letters = ("A".."Z").to_a.sample(2).join("")
    three_numbers = (1..9).to_a.sample(3).join("")
    two_letters << three_numbers
  end

  def add_to_file(name)
    File.open("ruby/robot-name/names.txt", 'a') do |f|
      f.puts name
    end
  end

  def stored_names
    File
      .readlines("ruby/robot-name/names.txt")
      .map { |name| name.gsub("\n", "") }
  end

  def self.forget
    # TODO
  end

  def reset
    @name = name_builder
  end
end

Robot.new.name # => "KQ798"
Robot.new.name # => "IA827"
