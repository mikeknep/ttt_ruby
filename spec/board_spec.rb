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

 it "has rows" do
    expect(board.rows).to eq([[0,1], [2,3]])
  end

  it "has columns" do
    expect(board.columns).to eq([[0,2], [1,3]])
  end

  it "has diagonals" do
    expect(board.diagonals).to eq([[1,2], [0,3]])
  end

  it "returns the values for a direction" do
    expect(board.get_values_for(board.rows)).to eq([['A','B'], ['C','D']])
  end
end
