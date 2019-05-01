def recite(start_verse, number_of_days):
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
                  1: ('first', 'and a Partridge in a Pear Tree.')
                }

    def verse_builder(number):
        """
        It's almost working. Now get the range working.
        It's not start/end, the arguments are:
        Start day/number of days
        """
        verse = f"On the {number} of Christmas my true love gave to me: "
        for key, val in lyric_map.items():
            verse = verse + val[1]

        return verse

    return verse_builder(lyric_map[start_verse][0])


print(recite(5, 5,))

        #  expected = ["On the fifth day of Christmas my true love gave to me: "
        #              "five Gold Rings, "
        #              "four Calling Birds, "
        #              "three French Hens, "
        #              "two Turtle Doves, "
        #              "and a Partridge in a Pear Tree."]
        #  self.assertEqual(recite(5, 5), expected)

