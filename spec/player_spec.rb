require 'spec_helper'

describe Player do 
  it "has a token" do
    expect(Player.new('X').token).to eq('X')
  end

  it "builds a specific kind of player with a custom token" do
    expect(Player.build_player('Joshua', 'M')).to be_a(Joshua)
  end
end


describe Human do
  it "is a kind of player" do
    expect(Human.new('X')).to be_a(Player)
  end
end


describe Jane do 
  it "is a kind of player" do
    expect(Jane.new('E')).to be_a(Player)
  end
end


describe Joshua do 
  it "is a kind of player" do
    expect(Joshua.new('J')).to be_a(Player)
  end
end
