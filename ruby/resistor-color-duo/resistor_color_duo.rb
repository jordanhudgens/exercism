module ResistorColorDuo
  def self.value(color_arr)
    Integer(self.value_lookup(color_arr[0]) + self.value_lookup(color_arr[1]))
  end

  def self.value_lookup(color)
    color_values = {
      "black"  => "0",
      "brown"  => "1",
      "red"    => "2",
      "orange" => "3",
      "yellow" => "4",
      "green"  => "5",
      "blue"   => "6",
      "violet" => "7",
      "grey"   => "8",
      "white"  => "9"
    }

    color_values[color]
  end
end

