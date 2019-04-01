class Clock
  attr_reader :hour, :minute

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
    @minute = minute_rules(other_clock.minute + @minute)
    @hour = hour_rules(other_clock.hour + @hour)
    self
  end

  def -(other_clock)
    @minute = minute_rules(@minute - other_clock.minute)
    @hour = hour_rules(@hour - other_clock.hour)
    self
  end
end

