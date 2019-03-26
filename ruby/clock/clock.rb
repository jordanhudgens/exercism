class Clock
  def initialize(hour: 0, minute: 0)
    @hour   = hour_rules(hour)
    @minute = minute_rules(minute)
  end

  def to_s
    "#{formatted_time(@hour)}:#{formatted_time(@minute)}"
  end

  def formatted_time(time)
    time.to_s.length == 1 ? "0#{time}" : time
  end

  def hour_rules(hour)
    if hour >= 24
      hour % 24
    elsif hour < 0
      hour
      if hour.abs > 24
        24 - hour.abs % 24
      else
        24 - hour.abs
      end
    else
      hour
    end
  end

  def minute_rules(minute)
    if minute >= 60
      if minute / 60 > 24
        @hour = hour_rules(@hour + ((minute / 60) - 24))
      else
        @hour += minute / 60
      end

      minute % 60
    elsif minute < 0
      if minute.abs > 60
        @hour = hour_rules(@hour - minute.abs / 60) - 1
        60 - (minute.abs % 60)
      elsif minute.abs == 60
        @hour = hour_rules(@hour - minute.abs / 60)
        0
      else
        @hour = @hour - (60 / minute.abs)
        60 - minute.abs
      end
    else
      minute
    end
  end

  def +(other_clock)
    self + other_clock
  end
end

Clock.new(hour: 1, minute: -160).to_s
Clock.new(hour: 2, minute: -60).to_s

clock1 = Clock.new(hour: 10, minute: 0)
# assert_equal "10:03", (clock1 + Clock.new(minute: 3)).to_s
(clock1 + Clock.new(minute: 3)).to_s
class Clock
  def initialize(hour: 0, minute: 0)
    @hour   = hour_rules(hour)
    @minute = minute_rules(minute)
  end

  def to_s
    "#{formatted_time(@hour)}:#{formatted_time(@minute)}"
  end

  def formatted_time(time)
    time.to_s.length == 1 ? "0#{time}" : time
  end

  def hour_rules(hour)
    if hour >= 24
      hour % 24
    elsif hour < 0
      hour
      if hour.abs > 24
        24 - hour.abs % 24
      else
        24 - hour.abs
      end
    else
      hour
    end
  end

  def minute_rules(minute)
    if minute >= 60
      if minute / 60 > 24
        @hour = hour_rules(@hour + ((minute / 60) - 24))
      else
        @hour += minute / 60
      end

      minute % 60
    elsif minute < 0
      if minute.abs > 60
        @hour = hour_rules(@hour - minute.abs / 60) - 1
        60 - (minute.abs % 60)
      elsif minute.abs == 60
        @hour = hour_rules(@hour - minute.abs / 60)
        0
      else
        @hour = @hour - (60 / minute.abs)
        60 - minute.abs
      end
    else
      minute
    end
  end


  # TODO
  # Properly alias method
  alias_method :plus, :+
  def +(other_clock)
    # self.plus(other_clock)
    2.plus(2)
  end
  alias_method :+, :plus

end

Clock.new(hour: 1, minute: -160).to_s
Clock.new(hour: 2, minute: -60).to_s

clock1 = Clock.new(hour: 10, minute: 0)
# assert_equal "10:03", (clock1 + Clock.new(minute: 3)).to_s
puts (clock1 + Clock.new(minute: 3)).to_s
