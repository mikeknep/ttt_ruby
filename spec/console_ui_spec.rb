require 'spec_helper'
require 'stringio'

describe ConsoleUI do
  it "determines the size of the board" do
    $stdin = StringIO.new('3')
    expect(ConsoleUI.determine_board_size).to eq(3)
  end

  it "determines if a player is Human, Jane, or Joshua" do
    $stdin = StringIO.new('Jane')
    expect(ConsoleUI.determine_player).to eq('Jane')
  end

  it "determines a player's token" do
    $stdin = StringIO.new('X')
    expect(ConsoleUI.choose_token).to eq('X')
  end

  it "builds a player with custom token" do
    expect(ConsoleUI.build_player('Joshua', 'M')).to be_a(Joshua)
  end
end
