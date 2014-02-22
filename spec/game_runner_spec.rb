require 'rspec'

describe GameRunner do
  let(:jane1)   { PlayerHelper.build_player('Jane', 'X') }
  let(:jane2)   { PlayerHelper.build_player('Jane', 'O') }
  let(:game)    { Game.new(board_size: 3, player_1: jane1, player_2: jane2) }
  let(:runner)  { GameRunner.new(game) }

  xit "ends the game when there is a winner" do
    runner.run
    game.board.spots = ['X','X','X',' ',' ',' ',' ',' ',' ']
    expect(game.over?).to eq(true)
  end
end
