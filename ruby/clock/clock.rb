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
    else
      minute
    end
  end
end

Clock.new(hour: -1).to_s # => "23:00"
