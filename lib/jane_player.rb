class JanePlayer
  attr_accessor :token

  def initialize(token)
    @token = token
  end

  def take_turn(board, *tokens)
    spot = SimpleAI.choose_next_move(board)
    Gameplay.take_turn(board, spot, token)
  end
end
