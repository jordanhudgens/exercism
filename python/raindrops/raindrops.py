def raindrops(number):
    RAINDROP_TYPES = {
        "Pling": 3,
        "Plang": 5,
        "Plong": 7
    }

    raindrop_str =  "".join([k for k, v in RAINDROP_TYPES.items() if number % v == 0])

    if raindrop_str == "":
        return str(number)
    else:
        return raindrop_str
