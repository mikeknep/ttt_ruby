class HumanPlayer
  attr_accessor :token

  def initialize(token)
    @token = token
  end

  def take_turn(board, *tokens)
    spot = HumanLogic.choose_next_move
    Gameplay.take_turn(board, spot, token)
  end
end
