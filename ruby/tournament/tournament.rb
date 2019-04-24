 MP: Matches Played
# W: Matches Won
# D: Matches Drawn (Tied)
# L: Matches Lost
# P: Points
# A win earns a team 3 points. A draw earns 1. A loss earns 0.

class Tournament
  attr_accessor :tournament_data

  def initialize(input)
    # have program automatically generate the score
    # and store in the tally value,
    # need to keep track of all teams since they
    # can show up multiple times
    self.tournament_data = input
  end

  def self.tally(input)
    scoreboard = <<~TALLY
    Team                           | MP |  W |  D |  L |  P
    TALLY
  end

  def team_builder
    self.tournament_data
  end

  def self.score_generator(game)
    game_arr = game.split(";")
    team_one = game_arr[0]
    team_two = game_arr[1]
    result   = game_arr[2]

    lines = (0..1).each_with_object("") do |idx, str|
      str << idx.to_s
    end
  end
end

input = <<~INPUT
Allegoric Alaskans;Blithering Badgers;win
Devastating Donkeys;Courageous Californians;draw
Devastating Donkeys;Allegoric Alaskans;win
Courageous Californians;Blithering Badgers;loss
Blithering Badgers;Devastating Donkeys;loss
Allegoric Alaskans;Courageous Californians;win
INPUT

# p Tournament.tally(input)

# Team                           | MP |  W |  D |  L |  P
# Allegoric Alaskans             |  1 |  1 |  0 |  0 |  3
# Blithering Badgers             |  1 |  0 |  0 |  1 |  0

Tournament.new(input).team_builder
