require 'spec_helper'

describe Gameplay do
  let(:jane)      { Jane.new('J') }
  let(:human)     { Human.new('H') }
  let(:game)      { Game.new(
                          board_size: 3,
                          player_1: jane,
                          player_2: human
                          ) }

  let(:gameplay)  { Gameplay.new(game) }

  it "is initialized with a game" do
    expect(gameplay.game).to be_a(Game)
  end

  it "knows which player's turn it is" do
    expect(gameplay.whose_turn).to eq(jane)
  end

  it "has a default next move" do
    expect(gameplay.next_move).to be_an(Integer)
  end

  it "plays a turn" do
    expect {
      gameplay.take_turn
    }.to change{game.board.spots}
  end
end
