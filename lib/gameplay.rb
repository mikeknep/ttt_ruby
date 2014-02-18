class Gameplay
  attr_accessor :game, :whose_turn, :next_move

  def initialize(game)
    @game = game
    @whose_turn = determine_which_player
    @next_move = rand(1..game.board.size**2) - 1
  end

  def determine_which_player
    count = 2

    game.board.spots.each do |spot|
      count += 1 if spot != " "
    end

    if count % 2 == 0
      return 'player_1'
    else
      return 'player_2'
    end
  end

  def take_turn
    game.board.spots[next_move] = game.send(whose_turn).token
  end
end
