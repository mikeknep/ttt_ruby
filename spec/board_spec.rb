require 'spec_helper'

describe Board do
  it "has a size that defines the number of rows and columns" do
    expect(Board.new(3).size).to eq(3)
  end

  it "has a collection of spots equal to the square of the size" do
    expect(Board.new(3).spots.count).to eq(9)
  end
end
