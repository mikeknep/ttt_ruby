require 'spec_helper'

describe UnbeatableAI do
  let(:board)     { Board.new(3) }
  let(:ai)        { UnbeatableAI }


  describe "choosing the next move" do
    context "when there is only one move available" do
      it "chooses the last remaining spot on the board when it leads to a draw" do
        board.spots = [' ','X','O',
                       'O','X','X',
                       'X','O','O']

        expect(ai.choose_next_move(board, 'X', 'O')).to eq(0)
      end

      it "chooses the last remaining spot on the board when it leads to a win" do
        board.spots = ['X','O','X',
                       'O','X','O',
                       'O','X',' ']

        expect(ai.choose_next_move(board, 'X', 'O')).to eq(8)
      end
    end

    context "when there are multiple moves available, one of which leads to immediate victory" do
      it "chooses the spot that wins immediately (test 1)" do
        board.spots = ['X',' ','O',
                       'O','X',' ',
                       'X','O',' ']

        expect(ai.choose_next_move(board, 'X', 'O')).to eq(8)
      end

      it "chooses the spot that wins immediately (test 2)" do
        board.spots = ['X',' ','O',
                       'O','X','O',
                       'X','X',' ']

        expect(ai.choose_next_move(board, 'O', 'X')).to eq(8)
      end

      it "chooses the spot that wins immediately (test 3)" do
        board.spots = ['X','O','X',
                       'O','O',' ',
                       'X',' ','X']

        expect(ai.choose_next_move(board, 'O', 'X')).to eq(5)
      end
    end

    context "when there are multiple moves available, none of which leads to immediate victory" do
      it "chooses a move that, if unplayed, would be played by the opponent to immediately win on the following turn" do
        board.spots = ['X','O','X',
                       'X','O',' ',
                       'O',' ',' ']

        expect(ai.choose_next_move(board, 'X', 'O')).to eq(7)
      end

      it "blocks the opponent when it can't win immediately" do
        board.spots = ['X',' ','O',
                       'O','O','X',
                       'X','X',' ']

        expect(ai.choose_next_move(board, 'O', 'X')).to eq(8)
      end

      it "blocks the opponent from winning" do
        board.spots = ['O','X',' ',
                       ' ','X',' ',
                       ' ',' ',' ']

        expect(ai.choose_next_move(board, 'O', 'X')).to eq(7)
      end
    end
  end
end
