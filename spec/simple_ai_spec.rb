require 'spec_helper'

describe SimpleAI do
  let(:board)   { Board.new(3) }

  it "chooses the next move" do
    board.spots[0] = 'x'

    expect(SimpleAI.new(board).choose_next_move).to eq(1)
  end
end
