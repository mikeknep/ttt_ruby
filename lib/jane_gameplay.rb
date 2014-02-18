class JaneGameplay < Gameplay
  attr_accessor :game, :whose_turn, :next_move

  def initialize(game)
    super
    @next_move = determine_next_move
  end

  def determine_next_move
    i = 0
    game.board.spots.each_with_index do |spot, index|
      i = index
      break if spot == " "
    end

    return i
  end

  def take_turn
    game.board.spots[next_move] = game.send(whose_turn).token
  end
end
