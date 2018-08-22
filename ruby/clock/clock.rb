## Horas non numero nisi serenas
class Clock
  MINUTES_IN_A_DAY = 1440

  def initialize(hour: 0, minute: 0)
    @clock = (make_mins(hour) + minute) % MINUTES_IN_A_DAY
  end

  def to_s
    hhmm_format(@clock)
  end

  ## This seems like a rare instance of where possibly breaking
  ## encapsulation by using .instance_variable_get may be justified,
  ## since an accessor method would break the API, and we're dealing
  ## with objects of the same class as part of the definition of that
  ## class.
  def +(other)
    hhmm_format((@clock +
                 other.instance_variable_get(:@clock)) %
                MINUTES_IN_A_DAY)
  end

  def -(other)
    hhmm_format((@clock -
                 other.instance_variable_get(:@clock)) %
                MINUTES_IN_A_DAY)
  end

  def ==(other)
    @clock == other.instance_variable_get(:@clock)
  end

  private

  def make_mins(hours)
    hours * 60
  end

  def hhmm_format(minutes)
    (minutes / 60).to_s.rjust(2, '0') << ':' <<
      (minutes % 60).to_s.rjust(2, '0')
  end
end

module BookKeeping
  VERSION = 3
end
