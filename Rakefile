require 'pry'

Dir['./lib/*.rb'].each { |file| require file }

task :console do
  puts "This is a pry console set up for your convenience. @player_1 is a human player, and @player_2 is a computer player using the Unbeatable AI. @runner is an instance of GameRunner using these two players and @board, a 3x3 Tic-Tac-Toe board."
  @board = Board.new(3)
  @player_1 = Player.new('X', ConsoleUI)
  @player_2 = Player.new('O', UnbeatableAI)

  @runner = GameRunner.new(@board, @player_1, @player_2)

  Pry.start
end


task :play do
  puts "Let's play Tic Tac Toe!"
 
  board_size      = ConsoleUI.ask_board_size
  board           = Board.new(board_size)

  puts "First, let's specify player 1."
  player_1_type         = ConsoleUI.ask_player_type
  player_1_intelligence = (player_1_type == 'computer') ? (ConsoleUI.ask_difficulty_level) : 'human'
  player_1_token        = ConsoleUI.ask_token

  player_1              = PlayerHelper.build_player(player_1_token, player_1_intelligence)


  puts "OK, great! Next, player 2."
  player_2_type         = ConsoleUI.ask_player_type
  player_2_intelligence = (player_2_type == 'computer') ? (ConsoleUI.ask_difficulty_level) : 'human'
  player_2_token        = ConsoleUI.ask_token

  player_2              = PlayerHelper.build_player(player_2_token, player_2_intelligence)


  ConsoleUI.display_board(board)

  runner = GameRunner.new(board, player_1, player_2)
  runner.run

  ConsoleUI.declare_result(board)
end
