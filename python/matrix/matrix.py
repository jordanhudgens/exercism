class Matrix(object):
    def __init__(self, matrix_string):
        self.matrix_string = matrix_string

    def row(self, index):
        split_lines = self.matrix_string("\n")
        >>> [el.split(" ") for el in str.split("\n")]

        # [['1', '2'], ['', '3', '4']]

        # TODO
        # start here and map over and convert each element to integer
        # Then pass in the index value
        pass

    def column(self, index):
        pass
