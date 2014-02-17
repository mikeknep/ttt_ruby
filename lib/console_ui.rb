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

  def self.build_player(name, token)
    Object.const_get(name).new(token)
  end
end
