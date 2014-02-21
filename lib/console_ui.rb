module ConsoleUI
  def self.determine_board_size
    $stdout.puts "What size board do you want to play on?"
    size = $stdin.gets.chomp.to_i
  end

  def self.determine_player
    $stdout.puts "Is this player Human, Jane, or Joshua?"
    player_name = $stdin.gets.chomp
  end

  def self.choose_token
    $stdout.puts "What token is this player using?"
    token = $stdin.gets.chomp
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
end
