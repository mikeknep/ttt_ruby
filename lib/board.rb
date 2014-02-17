class Board
  attr_accessor :size, :spots

  def initialize(size)
    @size = size
    @spots = Array.new(size**2, ' ')
  end
end
