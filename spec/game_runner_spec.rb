require 'rspec'

describe GameRunner do
  let(:human) { Player.build_player('Human', 'H') }
  let(:jane)  { Player.build_player('Jane', 'J') }
  let(:game)  { Game.new(board_size: 3, player_1: human, player_2: jane) }
  let(:runner)  { GameRunner.new(game) }

  it "determines which player's turn it is" do
    expect(runner.current_player).to eq(human)
  end

  it "ends the game when there is a winner" do
    pending "How do I test this??"
    runner.run
    game.board.spots = ['X','X','X',' ',' ',' ',' ',' ',' ']

  end
end
