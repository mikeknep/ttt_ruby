class JoshuaLogic
  attr_accessor :board

  def initialize(board)
    @board = board
  end


  def choose_next_move(board, token, opposite_token)
    best_score = -1.0/0
    best_move = nil

    available_spots(board).each do |spot_index|
      copy_board = copy_board_with_move(board, spot_index, token)
      score = -minimax(copy_board, token, opposite_token, 1)

      if score > best_score
        best_score = score
        best_move = spot_index
      end
    end

    best_move
  end


  def minimax(board, token, opposite_token, depth)
    best_score = -1.0/0
    score = nil

    if Rules.game_over?(board)
      return score_board(board, token, depth) / depth
    else
      available_spots(board).each do |spot_index|
        copy_board = copy_board_with_move(board, spot_index, opposite_token)
        score = minimax(copy_board, opposite_token, token, depth + 1)
        best_score = score if score > best_score
      end
      return best_score
    end
  end


  def available_spots(board)
    available_spots = Array.new

    board.spots.each_with_index do |spot, index|
      available_spots << index if spot == ' '
    end

    available_spots
  end


  def score_board(board, token, depth=0)
    if Rules.winner_on_board?(board) == token
      return (-1.0)**depth
    else
      return 0.0
    end
  end


  def copy_board_with_move(board, index, token)
    copy_spots = board.spots.dup
    copy_board = Board.new(board.size)
    copy_board.spots = copy_spots
    copy_board.spots[index] = token
    copy_board
  end

end
