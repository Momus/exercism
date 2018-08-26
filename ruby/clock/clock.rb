## Horas non numero nisi serenas
class Clock
  MINUTES_IN_A_DAY = 1440

  def initialize(hour: 0, minute: 0)
    @clock = ((hour * 60) + minute) %
             MINUTES_IN_A_DAY
  end

  def to_s
    (@clock / 60).to_s.rjust(2, '0') <<
      ':' <<
      (@clock % 60).to_s.rjust(2, '0')
  end

  def +(other)
    Clock.new minute: @clock +
                      other.clock
  end

  def -(other)
    Clock.new minute: @clock -
                      other.clock
  end

  def ==(other)
    @clock ==
      other.clock
  end

  protected

  attr_reader :clock
end

module BookKeeping
  VERSION = 3
end
