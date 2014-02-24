class Board
  attr_accessor :size, :spots

  def initialize(size)
    @size = size
    @spots = Array.new(size**2, ' ')
  end


  def get_values_for(indexes)
    indexes.map{|index| spots.values_at(index) }.flatten
  end
end
