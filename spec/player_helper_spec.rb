require 'spec_helper'

describe PlayerHelper do
  it "builds a specific kind of player with a custom token" do
    expect(PlayerHelper.build_player('Jane', 'M')).to be_a(JanePlayer)
  end
end
