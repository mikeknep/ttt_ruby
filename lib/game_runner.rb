class GameRunner
  attr_accessor :game

  def initialize(game)
    @game = game
  end

  def run
    until game.over?
      game.current_player.take_turn(game)
      ConsoleUI.display_board(game.board)
    end
  end
end
