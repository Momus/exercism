require 'benchmark'

## Exerecise to impliment my own transpose method for Ruby arrays.
module MyTranspose
  refine Array do
    def my_transpose
      num_cols = self[0].length
      column_matrix = Array.new(num_cols) { Array.new(length) }
      length.times do |r|
        num_cols.times do |c|
          column_matrix[c][r] = self[r][c]
        end
      end
      column_matrix
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

## Benchmark test of my_transpose
randarr = Array.new(1000) { Array.new(1000) { rand(1000) } }
my_transpose_time = Benchmark.measure do
  using MyTranspose
  500.times do
    randarr.my_transpose
  end
end
puts 'my transpose:'
puts my_transpose_time

transpose_time = Benchmark.measure do
  using MyTranspose
  500.times do
    randarr.transpose
  end
end

puts 'Array::transpose:'
puts transpose_time

## my transpose:
##  71.900000   0.430000  72.330000 ( 72.648392)
## Array::transpose:
##  14.250000   0.270000  14.520000 ( 14.596483)
