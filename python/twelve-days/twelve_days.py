def recite(start_verse, number_of_days):
    if (start_verse == 1 and number_of_days == 1):
        return ["On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree."]

    lyric_map = { 12: ('twelfth', 'twelve Drummers Drumming, '),
                  11: ('eleventh', 'eleven Pipers Piping, '),
                  10: ('tenth', 'ten Lords-a-Leaping, '),
                  9: ('ninth', 'nine Ladies Dancing, '),
                  8: ('eighth', 'eight Maids-a-Milking, '),
                  7: ('seventh', 'seven Swans-a-Swimming, '),
                  6: ('sixth', 'six Geese-a-Laying, '),
                  5: ('fifth', 'five Gold Rings, '),
                  4: ('fourth', 'four Calling Birds, '),
                  3: ('third', 'three French Hens, '),
                  2: ('second', 'two Turtle Doves, '),
                  1: ('first', 'and a Partridge in a Pear Tree.')
                }

    def verse_builder(number):
        verse = f"On the {number} day of Christmas my true love gave to me: "
        day_range = list(range(1, 13))
        day_range.reverse()
        index_of_start_day = day_range.index(start_verse)
        selected_days = day_range[index_of_start_day:(index_of_start_day + number_of_days)]

        for day in selected_days:
            verse = verse + lyric_map[day][1]

        return [verse]

    return verse_builder(lyric_map[start_verse][0])

#  print(recite(11, 11))
#  print(expected)
