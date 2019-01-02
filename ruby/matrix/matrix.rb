## Exerecise to impliment my own transpose method for Ruby arrays.
module MyTranspose
  refine Array do
    def my_transpose
      transpose
    end
  end
end

## Convert a string representing a matrix into a static
## multidelensional array.
class Matrix
  using MyTranspose
  attr_reader :rows, :columns

  def initialize(matrix_string)
    @rows = make_rows matrix_string
    @columns = make_columns
  end

  private

  def make_rows(matrix_string)
    matrix_string.lines.map { |row| row.split.map(&:to_i) }
  end

  def make_columns
    rows.my_transpose
  end
end
