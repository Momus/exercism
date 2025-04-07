"""
This exercise stub and the test suite contain several enumerated constants.

Enumerated constants can be done with a NAME assigned to an arbitrary,
but unique value. An integer is traditionally used because it’s memory
efficient.
It is a common practice to export both constants and functions that work with
those constants (ex. the constants in the os, subprocess and re modules).

You can learn more here: https://en.wikipedia.org/wiki/Enumerated_type
"""

# Possible sublist categories.
# Change the values as you see fit.
from typing import Any

SUBLIST = 3
SUPERLIST = 2
EQUAL = 1
UNEQUAL = 0

def is_sublist(longer: list[Any], shorter: list[Any]) -> bool:
    '''see if a shorter list is a sublist of longer list'''

    for idx in range(len(longer)  - len(shorter) + 1):
        if longer[idx:idx+len(shorter)] == shorter:
            return True
    return False

def sublist(list_one: list[Any], list_two: list[Any]) -> int:
    ''' test list membership of two sets'''

    if list_one == list_two:
        return EQUAL

    if is_sublist(list_one, list_two):
        return SUPERLIST

    if is_sublist(list_two, list_one):
        return SUBLIST

    return UNEQUAL
