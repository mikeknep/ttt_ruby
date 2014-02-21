class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(params={})
    @board = Board.new(params[:board_size])
    @player_1 = params[:player_1]
    @player_2 = params[:player_2]
  end

  def over?
    board.all_spots_taken? || board.winner?
  end

  def current_player
    count = 0

    board.spots.each do |spot|
      count += 1 if spot != " "
    end

    if count % 2 == 0
      return player_1
    else
      return player_2
    end
  end
end
