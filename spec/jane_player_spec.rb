require 'spec_helper'

describe JanePlayer do
  let(:jane)    { JanePlayer.new('O') }
  let(:board)   { Board.new(2) }

  it "has a token" do
    expect(jane.token).to eq('O')
  end

  it "takes a turn" do
    expect {
      jane.take_turn(board)
    }.to change{board.spots}
  end
end
