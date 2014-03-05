require 'spec_helper'

describe JoshuaLogic do
  let(:board)     { Board.new(3) }
  let(:logic)     { JoshuaLogic.new(board) }


  it "is initialized with a board" do
    expect(logic.board).to be_a(Board)
  end

  it "identifies all available_spots on the board" do
    board.spots = ['X',' ','O','O','X',' ','X','O',' ']

    expect(logic.available_spots(board)).to eq([1,5,8])
  end


  describe "copying the board" do
    it "makes a copy with an additional move" do
      board.spots = Array.new(9, ' ')
      copied_board = logic.copy_board_with_move(board, 4, 'X')

      expect(copied_board.spots[4]).to eq('X')
    end

    it "does not affect the original board" do
      board.spots = Array.new(9, ' ')
      copied_board = logic.copy_board_with_move(board, 4, 'X')

      expect(board.spots[4]).to eq(' ')
    end
  end


  describe "scoring individual boards" do
    it "scores a board with a winner at 0 depth +1" do
      board.spots = ['X',' ','O','O','X',' ','X','O','X']

      expect(logic.score_board(board, 'X')).to eq(1.0)
    end

    it "scores a cat's game board 0" do
      board.spots = ['X','X','O','O','O','X','X','O','X']

      expect(logic.score_board(board, 'X')).to eq(0.0)
    end

    it "scores a board with a winner one level deep -1" do
      board.spots = ['X',' ','O','O','X',' ','X','O','X']

      expect(logic.score_board(board, 'X', 1)).to eq(-1.0)
    end
  end


  describe "scoring with depth in minimax" do
    it "scores a draw move 0 (regardless of depth)" do
      board.spots = [' ','X','O','O','X','X','X','O','O']
      board.spots[0] = 'X'

      expect(logic.minimax(board, 'X', 'O', 0)).to eq(0)
    end

    it "scores a winning move at no depth +infinity" do
      board.spots = ['X',' ','O','O','X',' ','X','O',' ']
      board.spots[8] = 'X'

      expect(logic.minimax(board, 'X', 'O', 0)).to eq(2.0/0)
    end

    it "scores a winning move at 1 depth -1.0" do
      board.spots = ['X','O','X','X','O',' ','O',' ',' '] 
      board.spots[5] = 'X'
      board.spots[7] = 'O'

      expect(logic.minimax(board, 'O', 'X', 1)).to eq(-1.0)
    end

    it "scores a winning move at 2 depth +0.5" do
      board.spots = ['X',' ','O','O',' ',' ','X',' ',' ']
      board.spots[4] = 'X'
      board.spots[7] = 'O'
      board.spots[8] = 'X'

      expect(logic.minimax(board, 'X', 'O', 2)).to eq(0.5)
    end
  end


  describe "choosing the next move" do
    context "when there is only one move available" do
      it "chooses the last remaining spot on the board when it leads to a draw" do
        board.spots = [' ','X','O','O','X','X','X','O','O']

        expect(logic.choose_next_move(board, 'X', 'O')).to eq(0)
      end

      it "chooses the last remaining spot on the board when it leads to a win" do
        board.spots = ['X','O','X','O','X','O','O','X',' ']

        expect(logic.choose_next_move(board, 'X', 'O')).to eq(8)
      end
    end

    context "when there are multiple moves available, one of which leads to immediate victory" do
      it "chooses the spot that wins immediately (test 1)" do
        board.spots = ['X',' ','O','O','X',' ','X','O',' ']

        expect(logic.choose_next_move(board, 'X', 'O')).to eq(8)
      end

      it "chooses the spot that wins immediately (test 2)" do
        board.spots = ['X',' ','O','O','X','O','X','X',' ']

        expect(logic.choose_next_move(board, 'O', 'X')).to eq(8)
      end

      it "chooses the spot that wins immediately (test 3)" do
        board.spots = ['X','O','X','O','O',' ','X',' ','X']

        expect(logic.choose_next_move(board, 'O', 'X')).to eq(5)
      end
    end

    context "when there are multiple moves available, none of which leads to immediate victory" do
      it "chooses a move that, if unplayed, would be played by the opponent to immediately win on the following turn" do
        board.spots = ['X','O','X','X','O',' ','O',' ',' ']

        expect(logic.choose_next_move(board, 'X', 'O')).to eq(7)
      end

      it "blocks the opponent when it can't win immediately" do
        board.spots = ['X',' ','O','O','O','X','X','X',' ']

        expect(logic.choose_next_move(board, 'O', 'X')).to eq(8)
      end

      it "blocks the opponent from winning" do
        board.spots = ['O','X',' ',' ','X',' ',' ',' ',' ']

        expect(logic.choose_next_move(board, 'O', 'X')).to eq(7)
      end
    end
  end
end
