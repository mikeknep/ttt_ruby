require 'spec_helper'

describe HumanPlayer do
  let(:human)   { HumanPlayer.new('X') }
  let(:board)   { Board.new(2) }

  it "has a token" do
    expect(human.token).to eq('X')
  end

  it "takes a turn" do
    $stdin = StringIO.new('0')

    expect {
      human.take_turn(board)
    }.to change{board.spots}
  end
end
