def distance(strand_a, strand_b):
    if strand_a == strand_b:
        return 0
    elif len(strand_a) != len(strand_b):
        raise ValueError(".+")
    else:
        return distance_value(strand_a, strand_b)

def distance_value(strand_a, strand_b):
    distance = 0

    for index, char in enumerate(strand_a):
        if char != strand_b[index]:
            distance = distance + 1

    return distance
