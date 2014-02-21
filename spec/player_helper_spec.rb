require 'spec_helper'

describe PlayerHelper do
  it "builds a specific kind of player with a custom token" do
    expect(PlayerHelper.build_player('Joshua', 'M')).to be_a(Joshua)
  end
end
