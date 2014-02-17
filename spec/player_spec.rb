require 'spec_helper'

describe Player do
  it "has a token" do
    expect(Player.new('X').token).to eq('X')
  end
end
