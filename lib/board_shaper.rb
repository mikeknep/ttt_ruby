module BoardShaper
  class << self

    def all_path_indexes(size)
      row_indexes(size) + column_indexes(size) + diagonal_indexes(size)
    end

    private

    def row_indexes(size)
      all_rows = Array.new

      size.times do |row_number|
        row = (size * row_number)..((size * (row_number + 1)) - 1)
        all_rows << row.to_a
      end

      return all_rows
    end

    def column_indexes(size)
      row_indexes(size).transpose
    end

    def diagonal_indexes(size)
      d1 = Array.new
      d2 = Array.new

      size.times do |i|
        d1 << (size-1)*(i+1)
        d2 << (size+1)*(i)
      end

      return [d1, d2]
    end

  end
end
