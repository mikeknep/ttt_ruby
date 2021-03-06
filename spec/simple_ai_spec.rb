require 'spec_helper'

describe SimpleAI do
  let(:board)   { Board.new(3) }

  it "chooses the first available spot on the board" do
    board.spots[0] = 'x'

    expect(SimpleAI.choose_next_move(board)).to eq(1)
  end
end
