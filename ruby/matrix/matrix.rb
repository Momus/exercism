## Convert a string representing a matrix into an multidelensional array.
class Matrix
  def initialize(matrix_string)
    matricisze matrix_string
  end

  def rows
    @matrix
  end

  def columns
    @columns << @matrix.each_with_index { |row, index| }
  end

  private

  def matricisze(matrix_string)
    @matrix = matrix_string.split("\n").map { |z| z.split("\ ").map(& :to_i) }
  end
end


[0,0] [0,1] [0,2]
[1,0] [1,1] [1,2]
[2,0] [2,1] [2,2]
