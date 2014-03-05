require 'spec_helper'

describe JoshuaPlayer do
  let(:joshua)    { JoshuaPlayer.new('W') }
  let(:board)     { Board.new(2) }

  it "has a token" do
    expect(joshua.token).to eq('W')
  end

  it "takes a turn" do
    expect {
      joshua.take_turn(board, 'W', 'h')
    }.to change{board.spots}
  end
end
