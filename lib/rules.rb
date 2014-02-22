module Rules
  class << self

    def current_player(board)
      count = 0

      board.spots.each do |spot|
        count += 1 if spot != ' '
      end

      count % 2 == 0 ? 'player_1' : 'player_2'
    end


    def game_over?(board)
      all_spots_taken_on_board?(board) || winner_on_board?(board)
    end


    def all_spots_taken_on_board?(board)
      true if not board.spots.include?(' ')
    end


    def winner_on_board?(board)
      winner = false

      values_in_all_directions = Array.new
      [board.rows, board.columns, board.diagonals].each do |path|
        values_in_all_directions += board.get_values_for(path)
      end

      values_in_all_directions.each do |values|
        if values.uniq.length == 1 && values[0] != ' '
          winner = true
        end
      end

      return winner
    end
  end
end
