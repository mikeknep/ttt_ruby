require 'spec_helper'

describe ConsoleUI do
  it "determines the size of the board" do
    $stdin = StringIO.new('3')
    expect(ConsoleUI.ask_board_size).to eq(3)
  end

  it "determines if a player is a human or a computer" do
    $stdin = StringIO.new('human')
    expect(ConsoleUI.ask_player_type).to eq('human')
  end

  it "determines the difficulty level of the computer" do
    $stdin = StringIO.new('easy')
    expect(ConsoleUI.ask_difficulty_level).to eq('easy')
  end

  it "determines a player's token" do
    $stdin = StringIO.new('X')
    expect(ConsoleUI.ask_token).to eq('X')
  end

  it "determines the next move" do
    board = Board.new(3)
    $stdin = StringIO.new('5')

    expect(ConsoleUI.choose_next_move(board)).to eq(5)
  end

  it "prints a formatted representation of the board" do
    $stdout = StringIO.new
    board = Board.new(3)
    board.spots[0] = 'X'
    board.spots[1] = 'O'

    expect{
      ConsoleUI.display_board(board)
    }.to output("\n\nTic-Tac-Toe\n\nX|O| \n | | \n | | \n\n\n").to_stdout
  end
end
