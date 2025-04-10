'''given a number represented as a list of ints, convert bases'''

def highest_power(base: int, number: int) -> int:
    '''highest power of base that divides into number'''
    power: int = 1
    quotient: int = number
    while quotient !=0:
        quotient = number // base ** power
        power += 1
    return power - 2

def to_dec(input_base: int, number: list[int]) -> int:
    ''' base ten int from number as list of ints in another base'''
    if input_base < 2:
        raise ValueError("input base must be >= 2")

    power: int = len(number) - 1
    rebased:int = 0
    for num in number:
        if 0 > num  or num >= input_base:
            raise ValueError("all digits must satisfy 0 <= d < input base")
        rebased += (num * input_base ** power)
        power -= 1
    return rebased

def to_base(output_base: int, number: int) -> list[int]:
    '''from base ten int, a number as list of ints in specified base'''
    if output_base < 2:
        raise ValueError("output base must be >= 2")
    if not number:
        return [0]
    max_power: int = highest_power(output_base, number)
    dig_seq: list[int] = []
    while max_power > -1:
        quotient, number = divmod(number, output_base ** max_power)
        dig_seq.append(quotient)
        max_power -= 1
    return dig_seq


def rebase(input_base: int, digits: list[int], output_base: int) -> list[str]:
    '''number as list of ints in one base into another'''
    return to_base(output_base, to_dec(input_base, digits))
