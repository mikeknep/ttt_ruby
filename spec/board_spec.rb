require 'spec_helper'

describe Board do
  let(:board)   { Board.new(2) }

  before :each do
    board.spots = ['A','B','C','D']
  end

  it "has a size that defines the number of rows and columns" do
    expect(board.size).to eq(2)
  end

  it "has a collection of spots equal to the square of the size" do
    expect(board.spots.count).to eq(4)
  end

  it "returns the values of spots" do
    rows = BoardShaper.new(board.size).row_indexes

    expect(board.get_values_for(rows)).to eq([['A','B'], ['C','D']])
  end
end
