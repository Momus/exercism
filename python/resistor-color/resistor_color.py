def color_code(color):
    return colors(color)


def colors(c=None):
    bands = {"black": 0,
            "brown"  :1,
            "red"    :2,
            "orange" :3,
            "yellow" :4,
            "green"  :5,
            "blue"   :6,
            "violet" :7,
            "grey"   :8,
            "white"  :9,}
    return bands[c] if c else list(bands.keys())
