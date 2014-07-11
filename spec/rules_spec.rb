require 'spec_helper'

describe Rules do
  let(:board)   { Board.new(3) }
  let(:draw)    { ['X','X','O',
                   'X','X','O',
                   'O','O','X'] }

  let(:victory) { [' ','X',' ',
                   'O','X','O',
                   ' ','X',' '] }


  it "determines which player's turn it is" do
    board.spots = ['X','O',' ',
                   ' ',' ',' ',
                   ' ',' ',' ']

    expect(Rules.current_player_number(board)).to eq(1)
  end

  it "returns the available spots on the board" do
    board.spots = ['X','O','X',
                   'O',' ',' ',
                   ' ',' ',' ']

    expect(Rules.available_spots(board)).to eq([4,5,6,7,8])
  end

  describe "checking whether a spot is valid" do
    it "returns true for an open spot" do
      expect(Rules.valid_spot?(board, 5)).to eq(true)
    end

    it "returns false for a spot that has been played already" do
      board.spots[3] = 'X'

      expect(Rules.valid_spot?(board, 3)).to eq(false)
    end
  end

  it "declares the game over when the board is a draw" do
    board.spots = draw

    expect(Rules.game_over?(board)).to eq(true)
  end

  it "declares the game over when the board has a winner" do
    board.spots = victory

    expect(Rules.game_over?(board)).to eq(true)
  end

  it "returns the winner" do
    board.spots = victory

    expect(Rules.winner(board)).to eq('X')
  end
end
