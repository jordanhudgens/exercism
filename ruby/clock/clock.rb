class Clock
  def initialize(hour: 0, minute: 0)
    @hour   = hour_rules(hour)        # => 1
    @minute = minute_rules(minute)    # => 20
  end                                 # => :initialize

  def to_s
    "#{formatted_time(@hour)}:#{formatted_time(@minute)}"  # => "23:20"
  end                                                      # => :to_s

  def formatted_time(time)
    time.to_s.length == 1 ? "0#{time}" : time  # => 23, 20
  end                                          # => :formatted_time

  def hour_rules(hour)
    if hour >= 24           # => false, false
      hour % 24
    elsif hour < 0          # => false, true
      hour                  # => -1
      if hour.abs > 24      # => false
        24 - hour.abs % 24
      else
        24 - hour.abs       # => 23
      end                   # => 23
    else
      hour                  # => 1
    end                     # => 1, 23
  end                       # => :hour_rules

  def minute_rules(minute)
    if minute >= 60                                       # => false
      if minute / 60 > 24
        @hour = hour_rules(@hour + ((minute / 60) - 24))
      else
        @hour += minute / 60
      end

      minute % 60
    elsif minute < 0   # => true
      minute.abs       # => 160
      minute.abs / 60  # => 2
      minute.abs % 60  # => 40
      60 - minute.abs  # => -100

      if minute.abs >= 60                            # => true
        # TODO
        # Fix hours
        @hour = hour_rules(@hour - minute.abs / 60)  # => 23
        60 - (minute.abs % 60)                       # => 20
      else
        @hour = @hour - (60 / minute.abs)
        60 - minute.abs
      end                                            # => 20
    else
      minute
    end                                              # => 20
  end                                                # => :minute_rules
end                                                  # => :minute_rules

Clock.new(hour: 1, minute: -160).to_s  # => "23:20"
