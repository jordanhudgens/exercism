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
    else
      hour
    end
  end

  def minute_rules(minute)
    if minute >= 60
      if minute / 60 > 24
        @hour += (minute / 60) - 24
      else
        @hour += minute / 60
      end

      minute % 60
    else
      minute
    end
  end
end
