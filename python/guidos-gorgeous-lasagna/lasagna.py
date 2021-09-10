""""
Is lasagna! Mama mia!
"""

#  DONE: define the 'PREPARATION_TIME' constant
EXPECTED_BAKE_TIME = 40
#PREPARATION_TIME = 120

# DONE: define the 'bake_time_remaining()' function
def bake_time_remaining(elapsed_bake_time):
    '''
    :param elapsed_bake_time: int baking time already elapsed
    :return: int remaining bake time derived from 'EXPECTED_BAKE_TIME'

    Function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    '''

    return  EXPECTED_BAKE_TIME - elapsed_bake_time

# DONE: define the 'preparation_time_in_minutes()' function
def preparation_time_in_minutes(layers):
    '''
    the more-a layers, the mora-minutes
    '''
    return layers * 2

# DONE: define the 'elapsed_time_in_minutes()' function
def elapsed_time_in_minutes(number_of_layers, elapsed_bake_time):
    '''
    how mucha time for lasagna?
    '''
    return preparation_time_in_minutes(number_of_layers) + elapsed_bake_time
