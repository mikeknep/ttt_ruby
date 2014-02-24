require 'pry'

Dir['./lib/*.rb'].each { |file| require file }

task :console do
  puts "This is a pry console for experimenting with objects and methods. We've set up a 3x3 board (@board), a human player (@player_1), and a Jane computer player (@player_2). You can also access a GameRunner object (@runner) instantiated with these three objects."

  @board = Board.new(3)
  @player_1 = HumanPlayer.new('X')
  @player_2 = JanePlayer.new('O')

  @runner = GameRunner.new(@board, @player_1, @player_2)

  Pry.start
end


task :play do
  puts "Let's play Tic Tac Toe!"
 
  board_size      = ConsoleUI.ask_board_size
  board           = Board.new(board_size)

  puts "First, let's specify player 1."
  player_1_name   = ConsoleUI.ask_player_type
  player_1_token  = ConsoleUI.ask_token
  player_1        = PlayerHelper.build_player(player_1_name, player_1_token)

  puts "OK, great! Next, player 2."
  player_2_name   = ConsoleUI.ask_player_type
  player_2_token  = ConsoleUI.ask_token
  player_2        = PlayerHelper.build_player(player_2_name, player_2_token)

  ConsoleUI.display_board(board)

  runner = GameRunner.new(board, player_1, player_2)
  runner.run
end
