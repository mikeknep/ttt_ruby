require 'spec_helper'

describe Game do
  let(:game)  { Game.new(board_size: 4, player_1: Human.new('X'), player_2: Jane.new('O')) }

  it "has a board" do
    expect(game.board.size).to eq(4)
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

  it "changes status to 'over' when all spots are taken" do
    game.board.spots = Array.new(16, ['X','O'].sample)
    game.check_status

    expect(game.status).to eq("over")
  end
end
