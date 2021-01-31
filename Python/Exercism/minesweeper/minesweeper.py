def annotate(minefield):
    if len(minefield) == 0:
        return []
    rows = []
    for i in range(len(minefield)):
        if len(minefield[0]) != len(minefield[i]):
            raise ValueError(f'Wrong length of row {i}')
        row = ""
        for j in range(len(minefield[0])):

            if minefield[i][j] == '*':
                row += '*'
            elif minefield[i][j] == ' ':
                counter = 0
                if i > 0:
                    counter += minefield[i-1][max(0,j-1):j+2].count('*')
                counter += minefield[i][max(0,j-1):j+2].count('*')
                if i+1 < len(minefield):
                    counter += minefield[i+1][max(0,j-1):j+2].count('*')
                if counter > 0:
                    row += str(counter)
                else:
                    row += ' '
            else:
                raise ValueError('Unvalid char in the field')
        rows.append(row)
    return rows

