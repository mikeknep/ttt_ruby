class JoshuaPlayer
  attr_accessor :token

  def initialize(token)
    @token = token
  end

  def take_turn(board, current_token, opponent_token)
    spot = UnbeatableAI.new(board).choose_next_move(board, current_token, opponent_token)
    Gameplay.take_turn(board, spot, token)
  end
end
