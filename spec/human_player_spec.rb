require 'spec_helper'
require 'stringio'

describe HumanPlayer do
  let(:human)   { HumanPlayer.new('X') }
  let(:board)   { 
    $stdin = StringIO.new('0')
    Board.new(2) }

  it "has a token" do
    expect(human.token).to eq('X')
  end

  it "takes a turn" do
    expect {
      human.take_turn(board)
    }.to change{board.spots}
  end
end
