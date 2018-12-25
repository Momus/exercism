## High scores in a Frogger game.
class HighScores
  attr_reader :scores

  def initialize(scores)
    @scores = scores
  end

  def latest()
    scores[-1]
  end

  def personal_best()
    scores.max
  end

  def personal_top()
    scores.sort.reverse[0..2]
  end

  def report()
    difference = personal_best - latest
    "Your latest score was #{latest}. \
That's #{difference >  0 ? difference.to_s + " short of " : ""}\
your personal best!"
  end
end
