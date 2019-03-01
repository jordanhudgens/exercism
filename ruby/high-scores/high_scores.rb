class HighScores
  attr_reader :scores

  def initialize scores
    @scores = scores
  end

  def latest
    @scores.last
  end

  def personal_best
    @scores.max
  end

  def personal_top_three
    @scores.sort.reverse.first(3)
  end
end
