class HighScores(object):
    def __init__(self, scores):
        self.scores = scores

    def scores(self):
        return self.scores

    def latest(self):
        return self.scores[-1]

    def sorted_scores(self):
        return sorted(self.scores, reverse=True)

    def personal_best(self):
        return self.sorted_scores()[0]

    def personal_top_three(self):
        return self.sorted_scores()[0:3]

