require 'spec_helper'

describe Board do
  let(:board)   { Board.new(3) }
  it "has a size that defines the number of rows and columns" do
    expect(board.size).to eq(3)
  end

  it "has a collection of spots equal to the square of the size" do
    expect(board.spots.count).to eq(9)
  end

  it "determines if all spots are taken" do
    board.spots = Array.new(9, ['X','O'].sample)

    expect(board.all_spots_taken?).to eq(true)
  end

  context "checking for a winner" do
    it "determines if someone has won horizontally" do
      board.spots = ['X','X','X',' ',' ',' ',' ',' ',' ']

      expect(board.winner?(board.get_values_for(board.rows))).to eq(true)
    end

    it "determines if someone has won vertically" do
      board.spots = ['X',' ',' ','X',' ',' ','X',' ',' ']

      expect(board.winner?(board.get_values_for(board.columns))).to eq(true)
    end

    it "determines if someone has won diagonally" do
      board.spots = ['X',' ',' ',' ','X',' ',' ',' ','X']

      expect(board.winner?(board.get_values_for(board.diagonals))).to eq(true)
    end
  end
end
