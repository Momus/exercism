'''
Parse and evaluate simple math word problems returning the answer as an integer. '''

import operator as op

OPS = {"plus": op.add,
       "minus": op.sub,
       "multiplied": op.mul,
       "divided": op.truediv
    }

def wordy_format(question: str) -> (list[int], list[str]):
    '''Checks if the question is formatted propertly and gets it
    ready for calculation.

    Parameter:
    :question: A string starting with "What is" followed by altenating
               integer-strings and arithmetic operators strings
               terminated by a question mark.

    Returns:
    A tuple containing two lists. The first being the integers
    to be operated on, the second, a list of operators from the
    OPS dictionary.
    '''

    question = question[:-1].split()[2:]

    numbers = []
    operations = []
    last_word = "op"  #Prime the loop
    for word in question:
        if word == "by":
            continue
    #    print("word: ", word)
    #    print("last: ", last_word)
        if last_word == "op":
            try:
                numbers.append(int(word))
            except ValueError as exc:
                raise ValueError("syntax error") from exc
            last_word = "num"

        else:
     #       print("num_word: ", word)
     #       print("last: ", last_word)
            if word.lstrip('-').isdigit():
                raise ValueError("syntax error")
            if word in OPS:
                operations.append(word)
                last_word = "op"
            else:
                raise ValueError("unknown operation")

    if (not numbers) or (len(numbers) == len(operations)):
        raise ValueError("syntax error")

    return (numbers, operations)


def answer(question: str) -> int:
    '''Convert properly formatted string to a simple math problem, and
    provide integer answer.

    Parameter:
    :question: A string starting with "What is" followed by
               integer-strings and arithmetic operators strings

    Returns:
    integer answer to question

    '''
    nums, ops = wordy_format(question)
    return (nums, ops)
