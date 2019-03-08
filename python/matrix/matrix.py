import numpy as np

class Matrix(object):
    def __init__(self, matrix_string):
        self.matrix_string = matrix_string
        split_lines = self.matrix_string.split("\n")
        list_as_strings = [el.split(" ") for el in split_lines]
        self.rows = [[int(el) for el in row] for row in list_as_strings]
        self.columns = np.transpose(self.rows).tolist()

    def row(self, index):
        return self.rows[index - 1]

    def column(self, index):
        return self.columns[index - 1]
