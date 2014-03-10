module SimpleAI
  class << self

    def choose_next_move(board, *tokens)
      board.spots.index { |spot| spot == ' ' }
    end

  end
end
