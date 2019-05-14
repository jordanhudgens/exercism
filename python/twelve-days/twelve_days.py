def recite(start_verse, number_of_repetition):
    if (start_verse == 1 and number_of_repetition == 1):
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
        selected_days = day_range[index_of_start_day:(index_of_start_day + start_verse)]

        for day in selected_days:
            verse = verse + lyric_map[day][1]

        return [verse]

    # TODO
    # iterate over the number of repetitions
    return verse_builder(lyric_map[start_verse][0])


#  expected = [recite(n, n)[0] for n in range(1, 4)]
#  print(expected)
#  ['On the first day of Christmas my true love gave to me: a Partridge in a Pear Tree.', 'On the second day of Christmas my true love gave to me: two Turtle Doves, and a Partridge in a Pear Tree.', 'On the third day of Christmas my true love gave to me: three French Hens, two Turtle Doves, and a Partridge in a Pear Tree.']

#  print(recite(1, 3))
# ['On the first day of Christmas my true love gave to me: and a Partridge in a Pear Tree.']

