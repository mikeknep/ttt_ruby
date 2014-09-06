require 'spec_helper'

describe Player do
  let(:decision_maker)  { double("AI or human input mechanism", :choose_next_move => 4) }
  let(:player)          { Player.new('X', decision_maker) }
  let(:board)           { Board.new(3) }


  it "has a token" do
    expect(player.token).to eq('X')
  end

  it "uses the decision maker to choose a spot" do
    expect(player.choose_spot(board, 'X', 'O')).to eq(4)
  end
end
