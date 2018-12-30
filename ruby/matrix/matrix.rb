## Convert a string representing a matrix into a static
## multidelensional array.
class Matrix
  attr_reader :rows, :columns

  def initialize(matrix_string)
    make_rows matrix_string
    make_columns
  end

  private

  def make_rows(matrix_string)
    @rows = matrix_string.split("\n").map { |row| row.split("\ ").map(& :to_i) }
  end

  def make_columns
    @columns = rows.transpose
  end
end
