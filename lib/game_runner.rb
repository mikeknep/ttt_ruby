class GameRunner
  attr_accessor :board, :player_1, :player_2

  def initialize(board, player_1, player_2)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def run
    until Rules.game_over?(board)
      current_player.take_turn(board)
      ConsoleUI.display_board(board)
    end
  end

  def current_player
    player_string = Rules.current_player(board)
    player_object = instance_variable_get(player_string)
  end
end
