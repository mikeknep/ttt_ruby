module JoshuaLogic
  def self.choose_next_move(board)
    board.spots.index { |spot| spot == ' ' } # This line is the same as Jane's logic -- just take the first open spot on the board
  end
end
