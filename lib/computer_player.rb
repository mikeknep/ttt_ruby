class ComputerPlayer
  attr_accessor :token, :ai

  def initialize(token, ai)
    @token = token
    @ai = ai
  end

  def take_turn(board, current_token, opponent_token)
    spot = ai.new(board).choose_next_move(current_token, opponent_token)
    Gameplay.take_turn(board, spot, token)
  end

end
