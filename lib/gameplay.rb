class Gameplay
  attr_accessor :game, :whose_turn, :next_move

  def initialize(game)
    @game = game
    @whose_turn = determine_which_player
    @next_move = determine_next_move
  end

  def determine_which_player
    GameRunner.new(game).current_player
  end

  def determine_next_move # This method gets overwritten in the specific gameplay types, but needs to be here as a placeholder
    rand(1..game.board.size**2) - 1
  end

  def take_turn
    game.board.spots[next_move] = determine_which_player.token
  end
end
