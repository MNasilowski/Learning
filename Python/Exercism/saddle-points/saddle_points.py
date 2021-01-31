def saddle_points(matrix):
    #empty matrix == no saddle points
    if len(matrix) == 0:
        return []
    #irregular matrix == ValueError
    for row in matrix:
        if len(row) != len(matrix[0]):
            raise ValueError("We cannot find SP in Irregular Matrix")
    #lets find columns of the matrrix
    columns = []
    for i in range(len(matrix[0])):
        column = [matrix[j][i] for j in range(len(matrix))]
        columns.append(column)
    points = []
    #end saddle points
    for i in range(len(matrix)):
        for j in range(len(columns)):
            if (matrix[i][j] >= max(matrix[i]) 
            and matrix[i][j] <= min(columns[j])):
                points.append({"row": i+1, "column": j+1})
    return points
        
