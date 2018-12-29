## Convert a string representing a matrix into an multidelensional array.
class Matrix
  attr_reader :rows, :columns

  def initialize(matrix_string)
    make_rows matrix_string
    make_columns
  end

  private

  def make_rows(matrix_string)
    @rows = matrix_string.split("\n").map { |z| z.split("\ ").map(& :to_i) }
  end

  def make_columns
    index = 0
    @columns = []
    while index < @rows.length
      @columns[index] = []
      @rows[index].each_with_index { |val, row| @columns[index][row] = val }
      index += 1
    end
  end
end
