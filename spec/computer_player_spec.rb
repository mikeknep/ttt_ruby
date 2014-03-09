require 'spec_helper'

describe ComputerPlayer do
  let(:easy_computer)     { ComputerPlayer.new('O', SimpleAI) }
  let(:hard_computer)     { ComputerPlayer.new('O', UnbeatableAI) }
  let(:board)             { Board.new(2) }

  it "has a token" do
    expect(easy_computer.token).to eq('O')
  end

  describe "with the SimpleAI" do
    it "is initialized with the SimpleAI as its AI" do
      expect(easy_computer.ai).to eq(SimpleAI)
    end

    it "takes a turn using the SimpleAI" do
      expect {
        easy_computer.take_turn(board, 'O', 'X')
      }.to change{board.spots}
    end
  end

  describe "with the UnbeatableAI" do
    it "is initialized with the UnbeatableAI as its AI" do
      expect(hard_computer.ai).to eq(UnbeatableAI)
    end

    it "takes a turn using the UnbeatableAI " do
      expect {
        hard_computer.take_turn(board, 'O', 'X')
      }.to change{board.spots}
    end
  end
end
