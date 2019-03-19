def recite(start_verse, end_verse):
    lyric_map = { 12: ('twelfth', 'twelve Drummers Drumming'),
                  11: ('eleventh ', 'eleven Pipers Piping'),
                  10: ('tenth', 'ten Lords-a-Leaping'),
                  9: ('ninth', 'nine Ladies Dancing'),
                  8: ('eight', 'eight Maids-a-Milking'),
                  7: ('seventh', 'seven Swans-a-Swimming'),
                  6: ('sixth', 'six Geese-a-Laying'),
                  5: ('fifth', 'five Gold Rings'),
                  4: ('fourth', 'four Calling Birds'),
                  3: ('third', 'three French Hens'),
                  2: ('second', 'two Turtle Doves'),
                  1: ('first', 'a Partridge in a Pear Tree.')
                }

    def first_stanza(number):
        return f"On the {number} of Christmas my true love gave to me: "

    return first_stanza(5)


print(recite(1, 2,))
