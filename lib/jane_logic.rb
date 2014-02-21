module JaneLogic
  def self.choose_next_move(board)
    board.spots.index { |spot| spot == ' ' }
  end
end
