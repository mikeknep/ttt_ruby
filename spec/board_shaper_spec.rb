require 'spec_helper'

describe BoardShaper do
  it "returns the indexes for all paths on the board" do
    expect(BoardShaper.all_path_indexes(2)).to match_array([[0,1],[2,3],[0,2],[1,3],[0,3],[1,2]])
  end


  it "formats the board as a string" do
    board = Board.new(3)
    board.spots[0] = 'X'
    board.spots[1] = 'O'

    expect(BoardShaper.format_board_as_string(board)).to eq("\n\nTic-Tac-Toe\n\nX|O| \n | | \n | | \n\n\n")
  end


end
