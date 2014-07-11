module ConsoleUI
  class << self

    def ask_board_size
      $stdout.puts "What size board do you want to play on?"
      size = $stdin.gets.chomp.to_i
    end

    def ask_player_type
      $stdout.puts "Is this player a human or a computer?"
      player_type = $stdin.gets.chomp.downcase
    end

    def ask_difficulty_level
      $stdout.puts "What difficulty level is this computer? (easy/hard)"
      difficulty_level = $stdin.gets.chomp.downcase
    end

    def ask_token
      $stdout.puts "What token is this player using?"
      token = $stdin.gets.chomp
    end

    def choose_next_move(board, *tokens)
      $stdout.puts "Where would you like to play next?"
      next_move = $stdin.gets.chomp.to_i
    end

    def display_board(board)
      $stdout.puts BoardShaper.format_board_as_string(board)
    end

    def declare_result(board)
      result = Rules.winner(board) ? "#{Rules.winner(board)} wins!" : "Cat's game!"
      $stdout.puts result
    end

  end
end
