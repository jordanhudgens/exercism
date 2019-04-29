# MP: Matches Played
# W: Matches Won
# D: Matches Drawn (Tied)
# L: Matches Lost
# P: Points
# A win earns a team 3 points. A draw earns 1. A loss earns 0.

class Tournament
  def initialize(input)
    @tournament_data = input
    scoreboard_data = team_builder
  end

  def self.tally(input)
    scoreboard = <<~TALLY
    Team                           | MP |  W |  D |  L |  P
    TALLY
  end

  def score_generator_left_column(game, hash)
    {
      MP: (hash[:MP] + 1),
      W:  (game[2] == 'win'  ? (hash[:W] + 1) : hash[:W]),
      D:  (game[2] == 'draw' ? (hash[:D] + 1) : hash[:D]),
      L:  (game[2] == 'loss' ? (hash[:L] + 1) : hash[:L])
    }
  end

  def score_generator_right_column(game, hash)
    {
      MP: (hash[:MP] + 1),
      W:  (game[2] == 'win'  ? (hash[:L] + 1) : hash[:W]),
      D:  (game[2] == 'draw' ? (hash[:D] + 1) : hash[:D]),
      L:  (game[2] == 'loss' ? (hash[:W] + 1) : hash[:L])
    }
  end

  def team_builder
    raw_data_as_array_from_str = @tournament_data
      .split("\n")
      .map { |game| game.split(";") }

    raw_data_as_array_from_str.each_with_object({}) do |game, hash|
      # TODO
      # Fix weird output where values
      # aren't being counted up properly
      # Then add the points tally
      # Then format the output
      if hash[game[0]]
        hash[game[0]] = score_generator_left_column(game, hash[game[0]])
      else
        hash[game[0]] = empty_scorecard
        hash[game[0]] = score_generator_left_column(game, hash[game[0]])
      end

      if hash[game[1]]
        hash[game[1]] = score_generator_right_column(game, hash[game[1]])
      else
        hash[game[1]] = empty_scorecard
        hash[game[1]] = score_generator_right_column(game, hash[game[1]])
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

# input = <<~INPUT
# Allegoric Alaskans;Blithering Badgers;win
# Devastating Donkeys;Courageous Californians;draw
# Devastating Donkeys;Allegoric Alaskans;win
# Courageous Californians;Blithering Badgers;loss
# Blithering Badgers;Devastating Donkeys;loss
# Allegoric Alaskans;Courageous Californians;win
# INPUT

# p Tournament.tally(input)

# expected = <<~TALLY
# Team                           | MP |  W |  D |  L |  P
# Devastating Donkeys            |  3 |  2 |  1 |  0 |  7
# Allegoric Alaskans             |  3 |  2 |  0 |  1 |  6
# Blithering Badgers             |  3 |  1 |  0 |  2 |  3
# Courageous Californians        |  3 |  0 |  1 |  2 |  1
# TALLY

input = <<~INPUT
Allegoric Alaskans;Blithering Badgers;win
Blithering Badgers;Allegoric Alaskans;win
INPUT

Tournament.new(input).team_builder # => {"Allegoric Alaskans"=>{:MP=>2, :W=>1, :D=>0, :L=>0}, "Blithering Badgers"=>{:MP=>2, :W=>2, :D=>0, :L=>0}}
