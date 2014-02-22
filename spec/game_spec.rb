require 'spec_helper'

describe Game do
  let(:game)  { Game.new(board_size: 3, player_1: HumanPlayer.new('X'), player_2: JanePlayer.new('O')) }

  it "has a board" do
    expect(game.board).to be_a(Board)
  end

  it "has a player 1" do
    expect(game.player_1).to be_a(HumanPlayer)
  end

  it "has a player 2" do
    expect(game.player_2).to be_a(JanePlayer)
  end
end
