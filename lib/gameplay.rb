module Gameplay
  def self.take_turn(board, spot, token)
    board.spots[spot] = token
  end
end
