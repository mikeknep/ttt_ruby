require 'spec_helper'

describe Gameplay do
  let(:board)   { Board.new(3) }

  it "executes a turn" do
    expect {
      Gameplay.execute_turn(board, 4, 'X')
    }.to change{board.spots}
  end

  it "doesn't chante the board if the spot is invalid" do
    board.spots[3] = 'X'
    expect {
      Gameplay.execute_turn(board, 3, 'O')
    }.to_not change{board.spots}
  end
end
