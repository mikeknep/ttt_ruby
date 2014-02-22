require 'pry'

Dir['./lib/*.rb'].each { |file| require file }

task :console do
  puts "This is a pry console for experimenting with methods and such. We've set up a game (@game) being played on a 3x3 TTT board. Player 1 is a human, using H as their token. Player 2 is Jane, playing with the token J."

  @game = Game.new(
    board_size: 3,
    player_1: PlayerHelper.build_player('Human', 'H'),
    player_2: PlayerHelper.build_player('Jane', 'J')
  )

  Pry.start
end


task :nogame do
  @board = Board.new(3)
  @player_1 = HumanPlayer.new('X')
  @player_2 = JanePlayer.new('O')

  Pry.start
end



task :play do
  puts "Let's play Tic Tac Toe!"
 
  board_size      = ConsoleUI.determine_board_size

  puts "First, let's specify player 1."
  player_1_name   = ConsoleUI.determine_player
  player_1_token  = ConsoleUI.choose_token
  player_1        = PlayerHelper.build_player(player_1_name, player_1_token)

  puts "OK, great! Next, player 2."
  player_2_name   = ConsoleUI.determine_player
  player_2_token  = ConsoleUI.choose_token
  player_2        = PlayerHelper.build_player(player_2_name, player_2_token)


  @game = Game.new(
    board_size: board_size,
    player_1: player_1,
    player_2: player_2
  )

  ConsoleUI.display_board(@game.board)

  runner = GameRunner.new(@game)
  runner.run
end
