'''Version two of this problem:
This is designed to be faster by using the fact that "in"
will terminate as soon as a letter is found.
'''

from string import ascii_letters
LENGTH_OF_ALPHABET = 26

def is_pangram(sentence):
    ''' Determine if a sentence contains every letter of the alphabet'''
    found = set()
    for letter in ascii_letters:
        if letter in sentence:
            found.add(letter.lower())
    return len(found) == LENGTH_OF_ALPHABET
