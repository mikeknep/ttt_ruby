class Game
  attr_accessor :board, :status, :player_1, :player_2

  def initialize(params={})
    @board = Board.new(params[:board_size])
    @status = 'in_progress'
    @player_1 = params[:player_1]
    @player_2 = params[:player_2]
  end

  def check_status
    unless board.spots.include?(" ")
      @status = 'over'
    end

    return @status
  end
end
