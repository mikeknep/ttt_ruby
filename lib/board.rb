class Board
  attr_accessor :size, :spots

  def initialize(size)
    @size = size
    @spots = Array.new(size**2, ' ')
  end


  def all_spots_taken?
    true if not spots.include?(' ')
  end


  def rows
    row_template = Array.new
    size.times do |i|
      row_template << i
    end

    all_rows = Array.new
    size.times do |i|
      all_rows << row_template.map{|t| t + size*i}
    end

    return all_rows
  end

 
  def columns
    column_template = Array.new
    size.times do |i|
      column_template << size*i
    end

    all_columns = Array.new
    size.times do |i|
      all_columns << column_template.map{|t| t + i}
    end

    return all_columns
  end


  def diagonals
    d1 = Array.new
    size.times do |i|
      d1 << (size-1)*(i+1)
    end

    d2 = Array.new
    size.times do |i|
      d2 << (size+1)*i
    end

    return [d1, d2]
  end


  def get_values_for(direction)
    values = Array.new
    direction.each do |dir|
      values << dir.map{|i| spots.values_at(i) }.flatten
    end
    return values
  end


  def winner?
    winner = false

    paths = Array.new
    [self.rows, self.columns, self.diagonals].each do |path|
      paths += get_values_for(path)
    end

    paths.each do |path|
      if path.uniq.length == 1 && path[0] != ' '
        winner = true
      end
    end

    return winner
  end

end
