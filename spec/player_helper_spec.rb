require 'spec_helper'

describe PlayerHelper do
  it "builds a human player with a token" do
    expect(PlayerHelper.build_player('X', 'human')).to be_a(Player)
  end

  it "builds an easy computer player with a token" do
    expect(PlayerHelper.build_player('O', 'easy')).to be_a(Player)
  end

  it "builds an unbeatable computer player with a token" do
    expect(PlayerHelper.build_player('O', 'hard')).to be_a(Player)
  end
end
