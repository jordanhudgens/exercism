def recite(start_verse, end_verse):
    lyric_map = { 12: ('twelfth', 'twelve Drummers Drumming, '),
                  11: ('eleventh ', 'eleven Pipers Piping, '),
                  10: ('tenth', 'ten Lords-a-Leaping, '),
                  9: ('ninth', 'nine Ladies Dancing, '),
                  8: ('eight', 'eight Maids-a-Milking, '),
                  7: ('seventh', 'seven Swans-a-Swimming, '),
                  6: ('sixth', 'six Geese-a-Laying, '),
                  5: ('fifth', 'five Gold Rings, '),
                  4: ('fourth', 'four Calling Birds, '),
                  3: ('third', 'three French Hens, '),
                  2: ('second', 'two Turtle Doves, '),
                  1: ('first', 'a Partridge in a Pear Tree.')
                }

    def verse_builder(number):
        """
        It's almost working. Now get the range working.
        It's not start/end, the arguments are:
        Start day/number of days
        """
        verse = f"On the {number} of Christmas my true love gave to me: "
        for el in range(start_verse, end_verse):
            verse = verse + lyric_map[el][1]

        return verse

    return verse_builder(lyric_map[start_verse][0])


print(recite(1, 2,))
