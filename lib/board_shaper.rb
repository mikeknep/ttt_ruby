class BoardShaper
  attr_accessor :size

  def initialize(size)
    @size = size
  end

  def row_indexes
    all_rows = Array.new

    size.times do |row_number|
      row = (size * row_number)..((size * (row_number + 1)) - 1)
      all_rows << row.to_a
    end

    return all_rows
  end

  def column_indexes
    row_indexes.transpose
  end

  def diagonal_indexes
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
end
