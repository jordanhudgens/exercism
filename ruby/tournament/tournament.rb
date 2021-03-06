class Tournament
  def initialize(input)
    @tournament_data = input
    @sorted_scores = team_builder.sort_by {|key, value| [-value[:P], key]}.to_h
  end

  def self.tally(input)
    Tournament.new(input).tally_formatter
  end

  def tally_formatter
    scoreboard = <<~TALLY
    Team                           | MP |  W |  D |  L |  P
    TALLY

    @sorted_scores.each_with_object(scoreboard) do |(team, score), board|
      score_line_item = <<~LINE_ITEM
      #{team_formatter(team)}|  #{score[:MP]} |  #{score[:W]} |  #{score[:D]} |  #{score[:L]} |  #{score[:P]}
      LINE_ITEM
      board << score_line_item
    end
  end

  def team_formatter(team)
    spaces_needed = 31 - team.length
    team + (" " * spaces_needed)
  end

  def score_generator_left_column(result, hash)
    {
      MP: (hash[:MP] + 1),
      W:  (result == 'win'  ? (hash[:W] + 1) : hash[:W]),
      D:  (result == 'draw' ? (hash[:D] + 1) : hash[:D]),
      L:  (result == 'loss' ? (hash[:L] + 1) : hash[:L]),
      P:  point_calculator_for_left_column(result, hash)
    }
  end

  def point_calculator_for_left_column(result, hash)
    if result == 'win'
      hash[:P] + 3
    elsif result == 'draw'
      hash[:P] + 1
    else
      hash[:P]
    end
  end

  def score_generator_right_column(result, hash)
    {
      MP: (hash[:MP] + 1),
      L:  (result == 'win'  ? (hash[:L] + 1) : hash[:L]),
      D:  (result == 'draw' ? (hash[:D] + 1) : hash[:D]),
      W:  (result == 'loss' ? (hash[:W] + 1) : hash[:W]),
      P:  point_calculator_for_right_column(result, hash)
    }
  end

  def point_calculator_for_right_column(result, hash)
    if result == 'loss'
      hash[:P] + 3
    elsif result == 'draw'
      hash[:P] + 1
    else
      hash[:P]
    end
  end

  def team_builder
    @tournament_data
    raw_data_as_array_from_str = @tournament_data
      .split("\n")
      .map { |game| game.split(";") }

    raw_data_as_array_from_str

    raw_data_as_array_from_str.each_with_object({}) do |game, hash|
      if hash[game[0]]
        hash[game[0]] = score_generator_left_column(game[2], hash[game[0]])
      else
        hash[game[0]] = empty_scorecard
        hash[game[0]] = score_generator_left_column(game[2], hash[game[0]])
      end

      if hash[game[1]]
        hash[game[1]] = score_generator_right_column(game[2], hash[game[1]])
      else
        hash[game[1]] = empty_scorecard
        hash[game[1]] = score_generator_right_column(game[2], hash[game[1]])
      end

      hash
    end
  end

  def empty_scorecard
    {
      MP: 0,
      W:  0,
      D:  0,
      L:  0,
      P:  0
    }
  end
end
