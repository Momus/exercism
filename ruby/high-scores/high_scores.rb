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
    "Your latest score was #{latest}. \
That's #{high_vs_current + ' short of ' unless high_vs_current.empty?}\
your personal best!"
  end

  private

  def high_vs_current
    diff = personal_best - latest
    diff > 0 ? diff.to_s : ''
  end
end
