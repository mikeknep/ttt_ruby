require 'spec_helper'

describe Player do # General player class
  it "has a token" do
    expect(Player.new('X').token).to eq('X')
  end
end


describe Human do
  it "is a kind of player" do
    expect(Human.new('X')).to be_a(Player)
  end
end


describe Jane do # Sympathetic computer
  it "is a kind of player" do
    expect(Jane.new('E')).to be_a(Player)
  end
end


describe Joshua do # Relentless computer
  it "is a kind of player" do
    expect(Joshua.new('J')).to be_a(Player)
  end
end
