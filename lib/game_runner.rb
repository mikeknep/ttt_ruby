class GameRunner
  attr_accessor :board, :player_1, :player_2

  def initialize(board, player_1, player_2)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def run
    until Rules.game_over?(board)
      current_player.take_turn(board, current_player.token, opponent.token)
      ConsoleUI.display_board(board)
    end
  end

  private

  def current_player
    Rules.current_player_number(board) == 1 ? player_1 : player_2
  end

  def opponent
    current_player == player_1 ? player_2 : player_1
  end
end
