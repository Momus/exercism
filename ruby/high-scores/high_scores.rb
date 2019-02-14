## High scores in a Frogger game.
class HighScores
  attr_reader :scores

  def initialize(scores)
    @scores = scores
  end

  def latest
    scores.last
  end

  def personal_best
    scores.max
  end

  def personal_top
    scores.max(3)
  end

  def report
    "Your latest score was #{latest}. That's #{report_diff}your personal best!"
  end

  private

  def diff
    personal_best - latest
  end

  def report_diff
    "#{diff} short of " if diff > 0
  end
end
