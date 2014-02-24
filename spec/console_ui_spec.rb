require 'spec_helper'
require 'stringio'

describe ConsoleUI do
  it "determines the size of the board" do
    $stdin = StringIO.new('3')
    expect(ConsoleUI.ask_board_size).to eq(3)
  end

  it "determines if a player is Human, Jane, or Joshua" do
    $stdin = StringIO.new('Jane')
    expect(ConsoleUI.ask_player_type).to eq('Jane')
  end

  it "determines a player's token" do
    $stdin = StringIO.new('X')
    expect(ConsoleUI.ask_token).to eq('X')
  end

  pending "How do you test $stdout.puts ???" do
    it "displays the board" do
      board = Board.new(2)

      expect(ConsoleUI.display_board(board)).to #display the board
    end

    it "declares the winner of the game when there is one" do
      board = Board.new(2)
      board.spots = ['X','O','X',' ']

      expect(ConsoleUI.declare_result(board)).to eq('X wins!')
    end

    it "declares Cat's game when a draw" do
      board = Board.new(3)
      board.spots = ['X','O','X','X','O','X','O','X','O']

      expect(ConsoleUI.declare_result(board)).to eq("Cat's game!")
    end
  end
end
