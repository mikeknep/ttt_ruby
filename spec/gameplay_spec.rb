require 'spec_helper'

describe Gameplay do
  let(:board)   { Board.new(3) }

  it "plays a turn" do
    expect {
      Gameplay.take_turn(board, 4, 'X')
    }.to change{board.spots}
  end
end
