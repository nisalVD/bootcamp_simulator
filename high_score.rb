class HighScore
  attr_accessor :name :coding :social :job #total_score
  
  def initialize(player)
    @name = player[:name]
    @coding = player[:coding] 
    @social = player[:social] 
    @job = player[:job] 
  end
  

end