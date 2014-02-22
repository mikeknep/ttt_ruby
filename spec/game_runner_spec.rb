require 'rspec'

describe GameRunner do
  let(:board)   { Board.new(3) }
  let(:jane1)   { PlayerHelper.build_player('Jane', 'X') }
  let(:jane2)   { PlayerHelper.build_player('Jane', 'O') }
  let(:runner)  { GameRunner.new(board, jane1, jane2) }

  it "identifies the current player object" do
    expect(runner.current_player).to eq(jane1)
  end

  it "runs the game until there is a winner" do
    runner.run

    expect(Rules.game_over?(board)).to eq(true)
  end
end
