class Matrix(object):
    def __init__(self, matrix_string):
        self.matrix_string = matrix_string

    def row(self, index):
        split_lines = self.matrix_string.split("\n")
        list_as_strings = [el.split(" ") for el in split_lines]
        rows = [[int(el) for el in row] for row in list_as_strings]
        return rows[index - 1]

    def column(self, index):
        pass

