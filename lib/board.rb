class Board
  attr_accessor :size, :spots

  def initialize(size)
    @size = size
    @spots = Array.new(size**2, ' ')
  end


  def get_values_for(direction)
    values = Array.new
    direction.each do |dir|
      values << dir.map{|i| spots.values_at(i) }.flatten
    end
    return values
  end
end
