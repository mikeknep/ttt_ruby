require 'spec_helper'

describe Player do 
  it "has a token" do
    expect(Player.new('X').token).to eq('X')
  end
end


describe Human do
  let(:human)   { Human.new('X') }

  it "is a kind of player" do
    expect(human).to be_a(Player)
  end
end


describe Jane do
  let(:jane)    { Jane.new('E') }

  it "is a kind of player" do
    expect(jane).to be_a(Player)
  end
end


describe Joshua do 
  let(:joshua)  { Joshua.new('J') }

  it "is a kind of player" do
    expect(joshua).to be_a(Player)
  end
end
