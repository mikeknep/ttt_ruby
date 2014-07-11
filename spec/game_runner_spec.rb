require 'rspec'

describe GameRunner do
  let(:board)     { Board.new(3) }
  let(:player_1)  { Player.new('X', SimpleAI) }
  let(:player_2)  { Player.new('O', SimpleAI) }
  let(:runner)    { GameRunner.new(board, player_1, player_2) }

  it "runs the game until there is a winner" do
    runner.run

    expect(Rules.game_over?(board)).to eq(true)
  end
end
