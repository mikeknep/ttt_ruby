require 'spec_helper'

describe BoardShaper do
  it "returns the row indexes for a board size" do
    expect(BoardShaper.new(2).row_indexes).to match_array([[0,1], [2,3]])
  end

  it "returns the column indexes for a board size" do
    expect(BoardShaper.new(2).column_indexes).to match_array([[0,2], [1,3]])
  end

  it "returns the diagonal indexes for a board size" do
    expect(BoardShaper.new(2).diagonal_indexes).to match_array([[0,3], [1,2]])
  end

  it "returns the indexes for all paths on the board" do
    expect(BoardShaper.new(2).all_path_indexes).to match_array([[0,1],[2,3],[0,2],[1,3],[0,3],[1,2]])
  end
end
