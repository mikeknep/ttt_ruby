module Rules
  class << self

    def current_player_number(board)
      count = 0

      board.spots.each do |spot|
        count += 1 if spot != ' '
      end

      count % 2 == 0 ? 1 : 2
    end


    def available_spots(board)
      available_spots = Array.new

      board.spots.each_with_index do |spot, index|
        available_spots << index if spot == ' '
      end

      available_spots
    end


    def valid_spot?(board, spot)
      board.spots[spot] == ' '
    end


    def game_over?(board)
      true if all_spots_taken_on_board?(board) || winner(board)
    end


    def winner(board)
      values_in_all_directions(board).each do |values|
        if values.uniq.length == 1 && values[0] != ' '
          return values[0]
        end
      end
      nil
    end

    private

    def all_spots_taken_on_board?(board)
      true if not board.spots.include?(' ')
    end

    def values_in_all_directions(board)
      all_paths = BoardShaper.all_path_indexes(board.size)
      values_in_all_directions = Array.new

      all_paths.each do |path|
        values_in_all_directions << board.get_values_for(path)
      end

      return values_in_all_directions
    end
  end
end
