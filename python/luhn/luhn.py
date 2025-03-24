'''
A class to valdate credit cared numbers against the
Lurn algorithm
'''
class Luhn:  # pylint: disable=too-few-public-methods
    ''' Test if a number is a Lurn object'''  
    def __init__(self, card_num):
        self.number = "".join((card_num).split())

    def valid(self):
        "validate number against Luhn algorithm"
        try:
            digits = list(map(int, self.number))
        except ValueError:
            return False
        digits.reverse()
        for idx, elem  in enumerate(digits):
            if idx % 2 != 0:
                doubled = elem * 2
                if doubled > 9:
                    doubled -= 9
                digits[idx] = doubled
        return sum(digits) % 10 == 0 and self.number  != "0"
