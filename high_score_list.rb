class HighScoreList
  attr_accessor :scores
  
  def initialize
    @scores = []
  end

  def add_score(player)
    @scores << player
  end

  # def update_yaml
  # end

  # def publish
  # end

end