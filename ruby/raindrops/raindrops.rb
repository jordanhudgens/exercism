class Raindrops
  FACTORS = {
    'Pling': 3,
    'Plang': 5,
    'Plong': 7
  }.freeze

  def self.convert(num)
    sounds = FACTORS.map do |sound, factor|
      sound if (num % factor).zero?
    end.join
    sounds.empty? ? num.to_s : sounds
  end
end
