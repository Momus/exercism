import re
LENGTH_OF_ALPHABET = 26
def is_pangram(sentence):
    ''' Determine if a sentence contains every letter of the alphabet'''
    test_string = re.sub(r'[^a-zA-Z]+', '', sentence).lower()
    return len(set(list(test_string))) == LENGTH_OF_ALPHABET
