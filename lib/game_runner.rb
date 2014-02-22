class GameRunner

  # Under major construction

  attr_accessor :game

  def initialize(game)
    @game = game
  end

  def run
    until Rules.game_over?(game.board)
      Rules.current_player(game.board).take_turn(game)
      ConsoleUI.display_board(game.board)
    end
  end
end
