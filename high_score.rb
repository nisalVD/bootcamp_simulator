class HighScore
  attr_accessor :name :coding :social :job :date #total_score
  
  def initialize(player)
    @name = player[:name]
    @coding = player[:coding] 
    @social = player[:social] 
    @job = player[:job] 
    @date = player[:date]
  end
  

end