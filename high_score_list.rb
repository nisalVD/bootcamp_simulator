require 'terminal-table'
require 'date'
require 'colorize'
require 'yaml'

class HighScoreList

  attr_accessor :scores, :list_display, :add_score

  def initialize
    @scores = []
  end

  #this method first checks whether a YAML file containing player scores exists. If it does, it loads the file, appends the current player score, sorts the score list according to score size, and closes the file. If not, it creates a new file with the current player score.
  def add_score(character, total_score)
    if File.file?('high_score_list.yaml')
      @scores = YAML.load_file('high_score_list.yaml')
      @scores << [character.name.green, total_score, Date.today] 
      @scores = scores.sort_by { |entry| entry[1] }.reverse
      File.open('high_score_list.yaml', 'w') do |out|
        out.write @scores.to_yaml
      end
    else
      @scores << [character.name.green, total_score, Date.today]  
      File.open('high_score_list.yaml', 'w') do |out|
        out.write @scores.to_yaml
      end
    end        
  end

  #this method check whether a YAML file containing player scores exists. If so, it loads the file and adds each player's name, score and date as a row in the high score table. It then puts the table.
  def list_display
    if File.file?('high_score_list.yaml')
      @scores = YAML.load_file('high_score_list.yaml')
      rows = []
      @scores.each do |entry|
        rows << [entry[0], entry[1], entry[2]]
      end
      table = Terminal::Table.new :title => "Coder Academy - The Game: High Scores".cyan, :headings => ['Player Name'.cyan, 'Total Score'.cyan, 'Date'.cyan], :rows => rows
      puts table
    else
      puts "No scores to display - begin your game to add the first high score!".green 
    end
  end

end