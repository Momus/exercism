def is_valid(isbn):
    total = 0
    multiple = 10
    try:
        check_char = isbn[-1]
    except IndexError:
        return False
    if check_char == "X":
        total += 10
    else:
        try:
            total += int(check_char)
        except ValueError:
            return False
    for digit in isbn[:-1]:
        if digit == "-":
            continue
        try:
            total += int(digit) * multiple
            multiple -= 1
            if multiple < 1: #get out early if input too long
                return False
        except ValueError:
            return False

    return total % 11 == 0 if multiple == 1 else False
