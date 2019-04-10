class Clock
  attr_reader :hour, :minute  # => nil

  def initialize(hour: 0, minute: 0)
    @hour   = hour_rules(hour)        # => 10, 0
    @minute = minute_rules(minute)    # => 3,  30
  end                                 # => :initialize

  def to_s
    "#{formatted_time(@hour)}:#{formatted_time(@minute)}"  # => "08:33"
  end                                                      # => :to_s

  def formatted_time(time)
    time.to_s.length == 1 ? "0#{time}" : time  # => "08", 33
  end                                          # => :formatted_time

  def hour_rules(hour)
    if hour >= 24           # => false, false, false, false
      hour % 24
    elsif hour < 0          # => false, false, false, false
      hour
      if hour.abs > 24
        24 - hour.abs % 24
      else
        24 - hour.abs
      end
    else
      hour                  # => 10, 0, 8, 8
    end                     # => 10, 0, 8, 8
  end                       # => :hour_rules

  def minute_rules(minute)
    if minute >= 60                                       # => false, false, false
      if minute / 60 > 24
        @hour = hour_rules(@hour + ((minute / 60) - 24))
      else
        @hour += minute / 60
      end

      minute % 60
    elsif minute < 0                                     # => false, false, true
      if minute.abs > 60                                 # => false
        @hour = hour_rules(@hour - minute.abs / 60) - 1
        60 - (minute.abs % 60)
      elsif minute.abs == 60                             # => false
        @hour = hour_rules(@hour - minute.abs / 60)
        0
      else
        minute.abs                                       # => 27
        60 / minute.abs                                  # => 2
        @hour                                            # => 10
        @hour = hour_rules(@hour - (60 / minute.abs))    # => 8
        60 - minute.abs                                  # => 33
      end                                                # => 33
    else
      minute                                             # => 3, 30
    end                                                  # => 3, 30, 33
  end                                                    # => :minute_rules

  def +(other_clock)
    @minute = minute_rules(other_clock.minute + @minute)
    @hour = hour_rules(other_clock.hour + @hour)
    self
  end                                                     # => :+

  def -(other_clock)
    @minute = minute_rules(@minute - other_clock.minute)  # => 33
    @hour = hour_rules(@hour - other_clock.hour)          # => 8
    self                                                  # => #<Clock:0x007ffe1f037940 @hour=8, @minute=33>
  end                                                     # => :-
end                                                       # => :-

clock1 = Clock.new(hour: 10, minute: 3)  # => #<Clock:0x007ffe1f037940 @hour=10, @minute=3>
# assert_equal "09:33", (clock1 - Clock.new(minute: 30)).to_s
(clock1 - Clock.new(minute: 30)).to_s    # => "08:33"
