from random import seed, choices
from string import ascii_uppercase, digits



class Robot:
    '''little robots. all they have is a name'''

    __all_robots = set()


    def __init__(self):
        self.reset()

    def __repr__(self):
        return 'a little robot named {!r}'.format(self.name)
        
    def __del__(self):
        Robot.__all_robots.remove(self.name)
        del self

    def reset(self):
        try:
            old_name = self.name
        except AttributeError:
            old_name = None
        while (name := self.__gen_name()) in Robot.__all_robots:
            pass
        self.name = name
        Robot.__all_robots.add(name)
        if old_name is not None : Robot.__all_robots.remove(old_name)

    def __gen_name(self):
           return ''.join(choices(ascii_uppercase, k=2) + \
            choices(digits, k=3))




    
