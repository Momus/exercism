''' a simple tool to check for balanced brackets'''

def is_paired(input_string):
    ''' square, round, and braces, oh my!'''
    # Legal: [[{{(())}}]]
    # Not Legal: [(])]]
    open_bracket = ("(", "[", "{")
    reversed_bracket = {')':'(', ']':'[', '}':'{'}
    last_open = []

    for char in input_string:
        if char in open_bracket:
            last_open.append(char)
        if char in reversed_bracket:
            if not last_open:
                return False
            if reversed_bracket[char] != last_open[-1]:
                return False
            try:
                last_open.pop()
            except IndexError:
                return False
    return not last_open
