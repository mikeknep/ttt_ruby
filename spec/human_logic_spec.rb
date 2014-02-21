require 'spec_helper'
require 'stringio'

describe HumanLogic do
  it "returns the chosen spot" do
    $stdin = StringIO.new('4')

    expect(HumanLogic.choose_next_move).to eq(4)
  end
end
