class SimpleAI
  attr_accessor :board

  def initialize(board)
    @board = board
  end

  def choose_next_move
    board.spots.index { |spot| spot == ' ' }
  end
end
