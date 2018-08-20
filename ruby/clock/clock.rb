## A new kind of 24 hour clock in Ruby.
class Clock
  def initialize(hour: 0, minute: 0)
    @hour = hour
    @minute = minute
  end

  def to_s
    @hour.to_s.rjust(2, '0') + ':' +
      @minute.to_s.rjust(2, '0')
  end

  def +() end

  def -() end

  def ==()end
end
