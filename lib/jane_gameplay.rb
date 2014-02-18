class JaneGameplay < Gameplay

  def initialize(game)
    super
    @next_move = determine_next_move
  end

  def determine_next_move
    i = 0
    game.board.spots.each_with_index do |spot, index|
      i = index
      break if spot == " "
    end

    return i
  end

end
