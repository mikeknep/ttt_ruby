require 'spec_helper'

describe Rules do
  let(:board)   { Board.new(3) }
  let(:draw)    { ['X','X','O','X','X','O','O','O','X'] }
  let(:victory) { [' ','X',' ','O','X','O',' ','X',' '] }


  it "determines which player's turn it is" do
    board.spots = ['X','O',' ',' ',' ',' ',' ',' ',' ']

    expect(Rules.current_player_number(board)).to eq(1)
  end

  it "knows when all the spots are taken on a board" do
    board.spots = draw

    expect(Rules.all_spots_taken_on_board?(board)).to eq(true)
  end

  it "returns the values in all directions on the board" do
    board.spots = victory

    expect(Rules.values_in_all_directions(board)).to match_array(
      [ [' ','X',' '],
        ['O','X','O'],
        [' ','X',' '],
        [' ','O',' '],
        ['X','X','X'],
        [' ','O',' '],
        [' ','X',' '],
        [' ','X',' '] ])
  end

  it "knows when a player wins" do
    board.spots = victory

    expect(Rules.winner_on_board?(board)).to eq('X')
  end

  it "declares the game over when the board is a draw or has a winner" do
    board.spots = [draw, victory].sample

    expect(Rules.game_over?(board)).to eq(true)
  end
end
