require 'spec_helper'

describe JaneLogic do
  let(:board)   { Board.new(3) }

  it "chooses the next move" do
    board.spots[0] = 'x'

    expect(JaneLogic.choose_next_move(board)).to eq(1)
  end
end
