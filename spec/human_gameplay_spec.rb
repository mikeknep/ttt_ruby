require 'spec_helper'
require 'stringio'

describe HumanGameplay do
  let(:jane)      { Jane.new('J') }
  let(:human)     { Human.new('H') }
  let(:game)      { Game.new(
                          board_size: 3,
                          player_1: jane,
                          player_2: human
                          ) }
  let(:human_play) { 
    $stdin = StringIO.new('4')
    HumanGameplay.new(game) }

  it "is initialized with a game" do
    expect(human_play.game).to be_a(Game)
  end

  it "knows which player's turn it is" do
    game.board.spots[0] = 'J'
    expect(human_play.whose_turn).to eq('player_2')
  end

  it "determines the next move" do
    expect(human_play.next_move).to be_an(Integer)
  end

  it "plays a spot on the board" do
    expect {
      human_play.take_turn
    }.to change{game.board.spots}
  end

  it "plays the spot selected by the human" do
    human_play.whose_turn = 'player_2'
    human_play.take_turn
    expect(game.board.spots[4]).to eq('H')
  end
end
