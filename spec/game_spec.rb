require 'spec_helper'

describe Game do
  let(:game)  { Game.new(board_size: 3, player_1: Human.new('X'), player_2: Jane.new('O')) }

  it "has a board" do
    expect(game.board).to be_a(Board)
  end

  it "has a player 1" do
    expect(game.player_1).to be_a(Player)
  end

  it "has a player 2" do
    expect(game.player_2).to be_a(Player)
  end

  describe "checks if it is over" do
    it "is over when all spots have been played" do
      game.board.spots = ['X','X','O','O','O','X','X','O','X']

      expect(game.over?).to eq(true)
    end

    it "is over when someone has won" do
      game.board.spots = ['X','X','X',' ',' ',' ',' ',' ',' ']

      expect(game.over?).to eq(true)
    end
  end

  it "identifies the current player" do
    game.board.spots = ['X',' ',' ',' ',' ',' ',' ',' ',' ']

    expect(game.current_player).to eq(game.player_2)
  end
end
