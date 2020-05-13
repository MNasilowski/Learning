class Matrix:
    
    def __init__(self, matrix_string):
        # 1st and 2nd loop O(n)
        numbers = matrix_string.split()
        numbers = [int(number) for number in numbers]
        
        y_dim = int(len(matrix_string.split("\n")))
        x_dim = int(len(numbers)/y_dim)

        self._columns = []
        self._rows = []
        
        # 3rd loop O(n)
        for i in range(y_dim):
            self._rows.append(numbers[i*x_dim:(i + 1)*x_dim])
        # 4th loop O(n)
        for i in range(x_dim):
            self._columns.append(numbers[i::x_dim])
            
    def row(self, index):
        # O(1)
        index -= 1
        return self._rows[index]
    
    def column(self, index):
        # O(1)
        index -= 1
        return self._columns[index]