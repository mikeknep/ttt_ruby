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
    while game.status == "in_progress"
      current_gameplay = Object.const_get("#{self.current_player.class}Gameplay")
      current_gameplay.new(game).take_turn
      ConsoleUI.display_board(game.board)
      game.check_status
    end
  end
end
