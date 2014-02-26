module Gameplay
  def self.take_turn(board, spot, token)
    board.spots[spot] = token if valid_spot?(board, spot)
  end

  def self.valid_spot?(board, spot)
    board.spots[spot] == ' '
  end
end
