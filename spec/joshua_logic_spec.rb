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
    it "scores a winning board with no depth +1" do
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


  describe "finding the best move" do
    context "when only one move is available" do
      it "returns the only move on the board when it results in a win" do
        board.spots = ['X','X','O','O','X','O','X','O',' ']

        expect(logic.choose_next_move(board, 'X', 'O')).to eq(8)
      end

      it "returns the only move on the board when it results in a tie" do
        board.spots = ['X','X','O','O','X','X',' ','O','O']

        expect(logic.choose_next_move(board, 'X', 'O')).to eq(6)
      end
    end

    context "when two moves are available" do
      it "returns the move that wins immediately" do
        board.spots = ['X',' ','O','O','X','O','X','X',' ']

        expect(logic.choose_next_move(board, 'O', 'X')).to eq(8)
      end

      it "returns a winning move" do
        board.spots = ['X','O','X','O','O',' ','X',' ','X']

        expect(logic.choose_next_move(board, 'O', 'X')).to eq(5)
      end

      it "returns the move that leads to a draw if alternative leads to a loss" do
        board.spots = ['X',' ','O','O','O','X','X','X',' ']

        expect(logic.choose_next_move(board, 'O', 'X')).to eq(8)
      end

      it "returns a winning move when the alternative leads to a loss" do
        board.spots = ['O','O',' ','X','X','O','X','X',' ']

        expect(logic.choose_next_move(board, 'O', 'X')).to eq(2)
      end

      it "returns a winning move when the alternative leads to a draw" do
        board.spots = ['X','X',' ','O','O',' ','X','X','O']

        expect(logic.choose_next_move(board, 'O', 'X')).to eq(5)
      end

    end

    context "when three moves are available" do
      it "returns the move that wins immediately" do
        board.spots = ['X',' ','O','O','X',' ','X','O',' ']
        #require 'pry'
        #binding.pry
        expect(logic.choose_next_move(board, 'X', 'O')).to eq(8)
      end

      it "returns a draw move when no winning move is available" do
        board.spots = ['X','O',' ','X','O',' ','O','X',' ']

        expect(logic.choose_next_move(board, 'X', 'O')).to eq(2)
      end
    end
  end
end
