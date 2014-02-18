require 'spec_helper'

describe JaneGameplay do
  let(:jane)      { Jane.new('J') }
  let(:human)     { Human.new('H') }
  let(:game)      { Game.new(
                          board_size: 3,
                          player_1: jane,
                          player_2: human
                          ) }
  let(:jane_turn) { JaneGameplay.new(game) }

  it "is initialized with a game" do
    expect(jane_turn.game).to be_a(Game)
  end

  it "knows which player (1 or 2) in the game it is" do
    expect(jane_turn.whose_turn).to eq('player_1')
  end

  it "plays a spot on the board" do
    expect {
      jane_turn.take_turn
    }.to change{game.board.spots}
  end

  it "plays the first available spot on the board" do
    game.board.spots[0] = 'H'
    game.board.spots[1] = 'H'
    jane_turn.take_turn

    expect(game.board.spots[2]).to eq('J')
  end
end
