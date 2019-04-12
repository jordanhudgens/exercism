class Clock
  attr_reader :minutes

  MINUTES_IN_HOUR = 60
  MINUTES_IN_DAY = 24 * MINUTES_IN_HOUR

  def initialize(hour: 0, minute: 0)
    @minutes = (minute + hour * MINUTES_IN_HOUR) % MINUTES_IN_DAY
  end

  def to_s
    '%02d:%02d' % [minutes / MINUTES_IN_HOUR, minutes % MINUTES_IN_HOUR]
  end

  def +(clock)
    Clock.new(minute: minutes + clock.minutes)
  end

  def -(clock)
    Clock.new(minute: minutes - clock.minutes)
  end

  def ==(clock)
    minutes == clock.minutes
  end
end
