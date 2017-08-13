require 'terminal-table'
require 'date'

class HighScoreList
  attr_accessor :scores :table

  table = Terminal::Table.new :title => "Coder Academy - The Game: High Scores", :headings => ['Player Name', 'Date', 'Total Score'], :rows => rows

  def initialize
      @scores = []
    end
  end

  def add_score(player, total_score)
    @scores << [[player],[total_score],[Date.today]]
  end

  # def update_yaml
  # end

  # def publish
  # end

      if File.file?('high_score_list.yaml')
      @scores = YAML.load_file('high_score_list.yaml')
    else

end