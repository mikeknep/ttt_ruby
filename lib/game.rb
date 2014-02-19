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
end
