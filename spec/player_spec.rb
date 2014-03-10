require 'spec_helper'

describe Player do
  let(:human_player)  { Player.new('X', ConsoleUI) }
  let(:easy_computer) { Player.new('E', SimpleAI) }
  let(:hard_computer) { Player.new('H', UnbeatableAI) }
  let(:board)         { Board.new(2) }


  it "has a token" do
    expect(human_player.token).to eq('X')
  end

  it "takes a turn using input from the console" do
    $stdin = StringIO.new('1')

    expect {
      human_player.take_turn(board, 'X', 'E')
    }.to change{board.spots}
  end

  it "takes a turn using the simple AI" do
    expect {
      easy_computer.take_turn(board, 'E', 'X')
    }.to change{board.spots}
  end

  it "takes a turn using the unbeatable AI" do
    expect {
      hard_computer.take_turn(board, 'H', 'X')
    }.to change{board.spots}
  end
end
