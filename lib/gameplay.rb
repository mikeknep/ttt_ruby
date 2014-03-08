module Gameplay
  def self.take_turn(board, spot, token)
    board.spots[spot] = token if Rules.valid_spot?(board, spot)
  end
end
