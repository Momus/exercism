''' using regexp in match statements see:
https://stackoverflow.com/a/75089993/768772
and
https://www.dropbox.com/scl/fi/a0m1m99a9bib0leq8tm9g/rdh_toolkit.py?e=1&noscript=1&rlkey=3w4h9b2yaslil5w4st0r1j5iw&dl=0
'''
import re

class RegexEqual(str):
    '''Helper class to use the match statement with regular expressions'''

    def __eq__(self, pattern):
        '''overwrite the == function'''
        return bool(re.search(pattern, self))

class Rule: # pylint: disable=too-few-public-methods
    '''Helper class to be able use variables instead of strings
    in case statements.
    '''

    one = "^[aeiou]|^xr|^yt"
    "begins with at least one vowel or the patterns 'xr' and 'yt'"

    two = "^[b-df-hj-np-tv-z]+"
    "begins with one or more consonants"

    three = "^[b-df-hj-np-tv-z]*qu"
    "begins with zero or more consonants, with 'qu' following"

    four = "^[b-df-hj-np-tv-z]+y"
    "one or more consonants followed by a 'y'"

def translate(text: str) -> str:
    '''convert a string consisting of one or more space separated
    words to 'pig latin'
    '''
    suffix = "ay"

    def latinize(word):
        match RegexEqual(word):
            case Rule.one:
                return word + suffix
            case Rule.four:
                expr = re.match(Rule.four, word)
                return word[expr.end() - 1:] + expr.group()[:-1] + suffix
            case Rule.three:
                expr = re.match(Rule.three, word)
                return word[expr.end():] + expr.group() + suffix
            case Rule.two:
                expr = re.match(Rule.two, word)
                return word[expr.end():] + expr.group() + suffix
            case _:  #Should never get here
                return "no match"

    return " ".join([latinize(word) for word in text.split()])
