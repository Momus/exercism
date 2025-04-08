''' a simple tool to check for balanced brackets'''

def is_paired(input_string):
    ''' Legal: [[{{(())}}]]
     Not Legal: [(])]]'''
    open_bracket = "([{"
    reversed_bracket = {')':'(', ']':'[', '}':'{'}
    last_open = []

    for char in input_string:
        if char in open_bracket:
            last_open.append(char)
        elif char in reversed_bracket:
            if not last_open or reversed_bracket[char]!=last_open.pop():
                return False
    return not last_open
