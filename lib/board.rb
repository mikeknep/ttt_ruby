class Board
  attr_accessor :spots
  attr_reader :size

  def initialize(size)
    @size = size
    @spots = Array.new(size**2, ' ')
  end

  def get_values_for(indexes)
    indexes.map{|index| spots.values_at(index) }.flatten
  end
end
