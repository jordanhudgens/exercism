from collections import Counter

def is_isogram(string):
    if len(string) == 0:
        return True

    char_collection = Counter(string.replace(" ", "").replace("-", "").lower())

    for k, v in char_collection.items():
        if v > 1:
            return False

    return True
