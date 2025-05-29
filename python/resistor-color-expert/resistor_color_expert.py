'''translating resistor color bands to human-readable labels.'''
OHMS = {    "black" : 0,
            "brown" : 1,
            "red"   : 2,
            "orange": 3,
            "yellow": 4,
            "green" : 5,
            "blue"  : 6,
            "violet": 7,
            "grey"  : 8,
            "white" : 9  }

TOLERANCE = {    "grey"   : " ±0.05%",
                 "violet" : " ±0.1%" ,
                 "blue"   : " ±0.25%",
                 "green"  : " ±0.5%" ,
                 "brown"  : " ±1%"   ,
                 "red"    : " ±2%"   ,
                 "gold"   : " ±5%"   ,
                 "silver" : " ±10%"  ,
                 "black"  : "N/A"      }

PREFIX, SEP = (" ", " kilo", " mega"), 10**3

UNIT = "ohms"

def resistor_label(colors: list[str]) -> str:
    '''take 1, 4, or 5 colors as input and output the correct value in ohms.'''
    tolerance = TOLERANCE[colors.pop()]
    if not colors:
        return "0 " + UNIT

    multiplier = 10 ** OHMS[colors.pop()]
    
    resistance, exp = 0, 0
    while colors:
        resistance += (OHMS[colors.pop()] * (10 ** exp))
        exp += 1

    resistance *= multiplier

    pre = 0
    while pre < len(PREFIX) - 1:
        if (resistance / SEP ) >= 1:
            resistance /=  SEP
            pre += 1
        else:
            break

    return str(resistance).removesuffix('.0') + PREFIX[pre] + UNIT + tolerance
