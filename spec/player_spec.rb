require 'spec_helper'

describe Player do # General player class
  it "has a token" do
    expect(Player.new('X').token).to eq('X')
  end
end


describe Human do
  it "has a token" do
    expect(Human.new('X').token).to eq('X')
  end
end


describe Jane do # Sympathetic computer
  it "has a token" do
    expect(Jane.new('E').token).to eq('E')
  end
end


describe Joshua do # Relentless computer
  it "has a token" do
    expect(Joshua.new('J').token).to eq('J')
  end
end
