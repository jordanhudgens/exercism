$names = []

class Robot
  attr_accessor :name
  LETTERS = ('A'..'Z').to_a.freeze
  private_constant :LETTERS

  def initialize
    @name = name_builder
  end

  def name_builder
    unique = false

    until unique do
      temp_name = run_name_generator

      if !$names.include?(temp_name)
        $names << temp_name
        unique = true
      end
    end

    $names.last
  end

  def run_name_generator
    '%s%s%03d' % [LETTERS.sample, LETTERS.sample, rand(100)]
  end

  def self.forget
  end

  def reset
    initialize
  end
end
