MOVES = ["jump","close your eyes","double blink", "wink"]
def commands(number):
    order = int((f"{number:05b}")[0])*(2) - 1 
    secret_code = f"{number:05b}"[1:]
    moves = [MOVES[i] for i in range(len(MOVES)) if secret_code[i] == '1']
    return moves[::order]