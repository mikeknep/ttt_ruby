class Player
  attr_accessor :token, :decision_maker

  def initialize(token, decision_maker)
    @token = token
    @decision_maker = decision_maker
  end

  def choose_spot(board, current_token, opponent_token)
    decision_maker.choose_next_move(board, current_token, opponent_token)
  end
end
