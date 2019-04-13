module TwelveDays
  def self.gifts_with_index
    [
      {
        day: 'first',
        gift: 'a Partridge in a Pear Tree.'
      },
      {
        day: 'second',
        gift: 'two Turtle Doves, and '
      },
      {
        day: 'third',
        gift: 'three French Hens, '
      },
      {
        day: 'fourth',
        gift: 'four Calling Birds, '
      },
      {
        day: 'fifth',
        gift: 'five Gold Rings, '
      },
      {
        day: 'sixth',
        gift: 'six Geese-a-Laying, '
      },
      {
        day: 'seventh',
        gift: 'seven Swans-a-Swimming, '
      },
      {
        day: 'eighth',
        gift: 'eight Maids-a-Milking, '
      },
      {
        day: 'ninth',
        gift: 'nine Ladies Dancing, '
      },
      {
        day: 'tenth',
        gift: 'ten Lords-a-Leaping, '
      },
      {
        day: 'eleventh',
        gift: 'eleven Pipers Piping, '
      },
      {
        day: 'twelfth',
        gift: 'twelve Drummers Drumming, '
      },
    ]
  end

  def self.song
    song = ""

    12.times do |day|
      list_of_gifts = TwelveDays.gifts_with_index.slice(0, day + 1).reverse.each_with_object("") do |nested_day, str|
        str << nested_day[:gift]
      end

      song << "\nOn the #{TwelveDays.gifts_with_index[day][:day]} day of Christmas my true love gave to me: #{list_of_gifts}\n"
    end

    song.lstrip
  end
end
