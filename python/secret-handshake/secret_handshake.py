ACTION = ["wink", "double blink", "close your eyes", "jump"]

def commands(binary_str):
    comms = [int(x) for x in list(binary_str)]
    comms.reverse()
    seq = []
    for el in range(len(comms) - 1):
        if comms[el]:
            seq.append(ACTION[el])
    if comms[-1]:
        seq.reverse()
    return seq
