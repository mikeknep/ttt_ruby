class GameRunner
  attr_accessor :game

  def initialize(game)
    @game = game
  end

  def current_player
    count = 2

    game.board.spots.each do |spot|
      count += 1 if spot != " "
    end

    if count % 2 == 0
      return game.player_1
    else
      return game.player_2
    end
  end

  def run
    until game.over?
      current_gameplay = Object.const_get("#{self.current_player.class}Gameplay")
      current_gameplay.new(game).take_turn
      ConsoleUI.display_board(game.board)
    end
  end
end
