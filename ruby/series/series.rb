## Find serires of adjacent numbers.
class Series
  ARRAY_OFFSET = 1

  def initialize(series)
    @series = series.split('')
  end

  def slices(slice_size)
    raise ArgumentError if slice_size > series.length

    slices = []
    (series.length - slice_size + ARRAY_OFFSET)
      .times do |index|
      slices.push(series
                    .slice(index, slice_size)
                    .join)
    end
    slices
  end

  private

  attr_reader :series
end
