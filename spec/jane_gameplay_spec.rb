require 'spec_helper'

describe JaneGameplay do
  let(:jane)      { Jane.new('J') }
  let(:human)     { Human.new('H') }
  let(:game)      { Game.new(
                          board_size: 3,
                          player_1: jane,
                          player_2: human
                          ) }
  let(:jane_play) { JaneGameplay.new(game) }

  it "is initialized with a game" do
    expect(jane_play.game).to be_a(Game)
  end

  it "knows which player's turn it is" do
    expect(jane_play.token).to eq(jane.token)
  end

  it "determines the next move" do
    expect(jane_play.determine_next_move).to be_an(Integer)
  end

  it "plays a spot on the board" do
    expect {
      jane_play.take_turn
    }.to change{game.board.spots}
  end

  it "plays the first available spot on the board" do
    game.board.spots[0] = 'H'
    game.board.spots[1] = 'H'
    jane_play.take_turn

    expect(game.board.spots[2]).to eq('J')
  end
end
