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
    difference = personal_best - latest
    "Your latest score was #{latest}. \
That's #{difference.to_s + ' short of ' if difference > 0}\
your personal best!"
  end
end
