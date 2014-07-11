require 'spec_helper'

describe BoardShaper do
  it "returns the indexes for all paths on the board" do
    expect(BoardShaper.new(2).all_path_indexes).to match_array([[0,1],[2,3],[0,2],[1,3],[0,3],[1,2]])
  end
end
