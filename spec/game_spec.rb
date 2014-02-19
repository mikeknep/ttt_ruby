require 'spec_helper'

describe Game do
  let(:game)  { Game.new(board_size: 3, player_1: Human.new('X'), player_2: Jane.new('O')) }

  it "has a board" do
    expect(game.board.size).to eq(3)
  end

  it "has a player 1" do
    expect(game.player_1).to be_a(Player)
  end

  it "has a player 2" do
    expect(game.player_2).to be_a(Player)
  end

  it "is initialized with status = 'in_progress'" do
    expect(game.status).to eq("in_progress")
  end

  describe "checking status" do
    it "changes status to 'draw' when all spots are taken without a winner" do
      game.board.spots = ['X','X','O','O','O','X','X','O','X']
      game.check_status

      expect(game.status).to eq("draw")
    end

    it "changes status to 'over' when someone wins" do
      game.board.spots = ['X','X','X',' ',' ',' ',' ',' ',' ']
      game.check_status

      expect(game.status).to eq("winner")
    end
  end
end
