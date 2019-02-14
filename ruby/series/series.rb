## Find serires of adjacent numbers.
class Series
  def initialize(series)
    @series = series.chars
  end

  def slices(slice_size)
    raise ArgumentError if slice_size > series.length

    slices = []
    series.each_cons(slice_size) { |cons| slices.push(cons.join) }
    slices
  end

  private

  attr_reader :series
end
