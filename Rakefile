require 'pry'

Dir['./lib/*.rb'].each { |file| require file }

task :console do
  puts "Let's play Tic Tac Toe!"
  puts "OK, actually... we can't really play yet. But at least you can fire up Pry and check stuff out while you work!"
 
  board_size = ConsoleUI.determine_board_size

  player_1_name = ConsoleUI.determine_player
  player_1_token = ConsoleUI.choose_token

  player_2_name = ConsoleUI.determine_player
  player_2_token = ConsoleUI.choose_token

  
  player_1 = ConsoleUI.build_player(player_1_name, player_1_token)
  player_2 = ConsoleUI.build_player(player_2_name, player_2_token)


  @game = Game.new(
    board_size: board_size,
    player_1: player_1,
    player_2: player_2
  )

  Pry.start
end
