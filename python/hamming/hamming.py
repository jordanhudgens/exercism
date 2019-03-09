def distance(strand_a, strand_b):
    """Calculate the hamming distance between two DNA sequences"""
    if len(strand_a) != len(strand_b):
        raise ValueError('Invalid')
    return sum([c1 != c2 for c1, c2 in zip(strand_a, strand_b)])
