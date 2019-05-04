module Gigasecond
  def self.from(time)
    Time.at(time + 1_000_000_000).utc
  end
end
