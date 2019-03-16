class Clock
  def initialize(hour:, minute: 0)
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
    minute
  end
end
