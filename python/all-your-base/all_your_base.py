'''all your base'''

def from_base(input_base: int, number: int) -> int:
    ''' base ten int from base, number in base'''
    num_list: list[str] = list(str(number))
    num_list.reverse()
    out: int = 0
    for power, digit in enumerate(num_list):
        if int(digit) > input_base:
            raise ValueError("all digits must satisfy 0 <= d < input base")
        out += (int(input_base ** power)) * int(digit)
    return out

def to_base(output_base: int, number: int) -> int:
    pass


def rebase(input_base: int, digits: list[int], output_base: int) -> list[str]:
    '''belong to us'''
    return [to_base(output_base, from_base(input_base, num)) for num in digits]
