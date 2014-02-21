module HumanLogic
  def self.choose_next_move
    $stdout.puts "Where do you want to go next?"
    next_move = $stdin.gets.chomp.to_i
  end
end
