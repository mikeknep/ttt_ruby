class Gameplay
  attr_accessor :game, :token, :next_move

  def initialize(game)
    @game = game
    @token = game.current_player.token
    @next_move = determine_next_move
  end

  def determine_next_move # This method gets overwritten in the specific gameplay types, but needs to be here as a placeholder
    rand(1..game.board.size**2) - 1
  end

  def take_turn
    game.board.spots[next_move] = token
  end
end
