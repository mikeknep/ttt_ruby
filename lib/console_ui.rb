module ConsoleUI
  def self.ask_board_size
    $stdout.puts "What size board do you want to play on?"
    size = $stdin.gets.chomp.to_i
  end

  def self.ask_player_type
    $stdout.puts "Is this player Human, Jane, or Joshua?"
    player_name = $stdin.gets.chomp
  end

  def self.ask_token
    $stdout.puts "What token is this player using?"
    token = $stdin.gets.chomp
  end

  def self.choose_next_move(board, *tokens)
    $stdout.puts "Where would you like to play next?"
    next_move = $stdin.gets.chomp.to_i
  end

  def self.display_board(board)
    board_as_string = "\n\nTic-Tac-Toe\n\n"

    board.spots.each_with_index do |spot, index|
      border_or_newline = ((index + 1) % board.size == 0) ? "\n" : "|"
      board_as_string << spot + border_or_newline
    end

    board_as_string << "\n\n"

    $stdout.puts board_as_string
  end

  def self.declare_result(board)
    result = Rules.winner_on_board?(board) ? "#{Rules.winner_on_board?(board)} wins!" : "Cat's game!"

    $stdout.puts result
  end
end
