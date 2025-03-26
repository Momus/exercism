'''
An excersize in class in a game for the classless
'''

from random import randrange

class Character: # pylint: disable=too-few-public-methods
    '''a D&D charecter with six attributes'''

    ATTRIBUTES = (
        'strength', 'dexterity', 'constitution',
        'intelligence', 'wisdom', 'charisma')

    def __init__(self):
        for attribute in Character.ATTRIBUTES:
            setattr(self, attribute, self.ability())
        self.hitpoints = 10 + modifier(self.constitution)

    @classmethod
    def ability(cls):
        "simulates those annoying dice thows"
        dice = [randrange(1,7) for _ in range(4) ]
        return sum(dice) - min(dice)


def modifier(value):
    "how many 'hit points' based on 'constitution'"
    return (value - 10) // 2
