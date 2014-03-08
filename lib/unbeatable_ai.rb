class UnbeatableAI
  attr_accessor :board

  def initialize(board)
    @board = board
  end


  def choose_next_move(token, opposite_token)
    best_score = -1.0/0
    best_move = nil

    Rules.available_spots(board).each do |spot_index|
      copy_board = copy_board_with_move(board, spot_index, token)
      score = minimax(copy_board, token, opposite_token, 0)

      if score > best_score
        best_score = score
        best_move = spot_index
      end
    end

    best_move
  end


  def minimax(board, token, opposite_token, depth)
    score = nil
    comp_score = (-1.0/0)**depth
    operator = (depth % 2 == 0) ? '<' : '>'

    if Rules.game_over?(board)
      score = score_board(board, token, depth) / depth
      score.nan? ? (return 0) : (return score)
    else
      Rules.available_spots(board).each do |spot_index|
        copy_board = copy_board_with_move(board, spot_index, opposite_token)
        score = minimax(copy_board, opposite_token, token, depth + 1)
        comp_score = score if score.send(operator, comp_score)
      end
      return comp_score
    end
  end



  def score_board(board, token, depth=0)
    if Rules.winner_on_board?(board) == token
      return (-1.0)**depth
    else
      return 0.0
    end
  end


  def copy_board_with_move(board, index, token)
    copy_board = board.dup
    copy_board.spots = board.spots.dup
    copy_board.spots[index] = token
    copy_board
  end

end
