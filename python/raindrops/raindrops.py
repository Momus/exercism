def convert(number):
    '''Given a number, will convert it to a nonsense phrase.'''
    answer = ''
    if not number % 3: answer += "Pling"
    if not number % 5: answer += "Plang"
    if not number % 7: answer += "Plong"

    return answer or str(number)
