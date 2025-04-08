'''
Convert three band colors to resistance rating
'''


BAND = {"black": 0,
        "brown"  :1,
        "red"    :2,
        "orange" :3,
        "yellow" :4,
        "green"  :5,
        "blue"   :6,
        "violet" :7,
        "grey"   :8,
        "white"  :9,}

UNIT = "ohms"
PREFIX = {10**9: "giga", 10**6: "mega", 10**3: "kilo"}

def label(colors: list[str]) -> str:
    '''convert the first three color names on a
    string to ohms'''
    first, second, third, *_  = colors
    resistance = ((10 * BAND[first]) + BAND[second]) \
                 * (10 ** BAND[third])

    prefix = ""
    for base, affix in PREFIX.items():
        if resistance >= base:
            prefix = affix
            resistance = resistance / base
            break

    str_resistance = str(resistance)
    if "." in str_resistance:
        str_resistance = str_resistance.rstrip("0").rstrip(".")

    return str_resistance + " " + prefix + UNIT
