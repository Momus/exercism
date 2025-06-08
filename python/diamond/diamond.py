"""
takes as its input a letter, and outputs it in a diamond shape.
"""

FIRST = 65  # Keep track of where the 'A' is


def rows(letter):
    """
    Given a letter, it print out a diamond starting with 'A', with the
    supplied letter at the widest point.ñ
    """

    char = ord(letter)
    diamond = []
    half_len = char - FIRST

    if char == FIRST:
        return ['A']

    if char == FIRST + 1:
        return [' A ', 'B B', ' A ']

    a_row = half_len * ' ' + 'A' + half_len * ' '
    diamond.append(a_row)

    for pos in range(half_len):
        lettr = FIRST + pos + 1
        this_chr = chr(lettr)
        int_space = half_len + pos
        ext_space = half_len - pos

        diamond.append(
            ext_space * ' '
            + this_chr + int_space * ' '
            + this_chr + ext_space * ' '
        )

    for pos in range(half_len - 1, 0, -1):
        lettr = FIRST + pos 
        this_chr = chr(lettr)
        int_space = half_len + pos
        ext_space = half_len - pos

        diamond.append(
            ext_space * ' '
            + this_chr + int_space * ' '
            + this_chr + ext_space * ' '
        )

    diamond.append(a_row)
    return diamond
