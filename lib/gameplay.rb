class Gameplay
  attr_accessor :game, :whose_turn

  def initialize(game)
    @game = game
    @whose_turn = determine_which_player
  end

  def determine_which_player
    count = 2

    game.board.spots.each do |spot|
      count += 1 if spot != " "
    end

    if count % 2 == 0
      return 'player_1'
    else
      return 'player_2'
    end
  end
end
