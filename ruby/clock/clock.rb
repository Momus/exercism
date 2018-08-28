## Horas non numero nisi serenas
class Clock
  MINUTES_IN_A_DAY = 1440

  BABYLONIAN_BASE = 60

  def initialize(hour: 0, minute: 0)
    @clock = ((hour * 60) + minute) %
             MINUTES_IN_A_DAY
  end

  def to_s
    format('%02d:%02d', hours, minutes)
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
    self.class == other.class &&
      @clock == other.clock
  end

  alias eql? ==

  def hash
    @clock.hash
  end

  protected

  attr_reader :clock

  private

  def minutes
    @clock % BABYLONIAN_BASE
  end

  def hours
    @clock / BABYLONIAN_BASE
  end
end

module BookKeeping
  VERSION = 3
end
