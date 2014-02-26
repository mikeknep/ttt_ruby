require 'spec_helper'

describe Gameplay do
  let(:board)   { Board.new(3) }

  it "plays a turn" do
    expect {
      Gameplay.take_turn(board, 4, 'X')
    }.to change{board.spots}
  end

  it "returns false for an invalid move" do
    board.spots[3] = 'X'

    expect(Gameplay.valid_spot?(board, 3)).to eq(false)
  end

  it "returns true for a valid move" do
    board.spots[3] = 'X'

    expect(Gameplay.valid_spot?(board, 5)).to eq(true)
  end

  it "doesn't play a turn if the spot is invalid" do
    board.spots[3] = 'X'
    expect {
      Gameplay.take_turn(board, 3, 'O')
    }.to_not change{board.spots}
  end
end
