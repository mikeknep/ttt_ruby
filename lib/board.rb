class Board
  attr_accessor :size, :spots

  def initialize(size)
    @size = size
    @spots = create_spots
  end

  def create_spots
    spots_array = Array.new
    (size ** 2).times { spots_array << nil }
    spots_array
  end
end
