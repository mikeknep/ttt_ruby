class Player
  attr_accessor :token, :decision_maker

  def initialize(token, decision_maker)
    @token = token
    @decision_maker = decision_maker
  end

  def take_turn(board, current_token, opponent_token)
    spot = decision_maker.choose_next_move(board, current_token, opponent_token)
    Gameplay.take_turn(board, spot, token)
  end
end
