require 'terminal-table'
require 'date'
require 'colorize'
require 'yaml'

class HighScoreList

  attr_accessor :scores, :list_display, :add_score

  def initialize
    @scores = []
  end

  #this method first checks whether a YAML file containing player scores (as an array of arrays) exists. If it does, it loads the file, appends the current player score, sorts the score list according to score size, and closes the file. If not, it creates a new file with the current player score.
  def add_score(character)
    if File.file?('high_score_list.yaml')
      @scores = YAML.load_file('high_score_list.yaml')
      player = {
        name: character.name,
        total_score: character.findscore,
        date: Date.today,
      }
      @scores << player 
      @scores = scores.sort_by { |entry| entry[2] }
      File.open('high_score_list.yaml', 'w') do |out|
        YAML.dump scores.to_yaml, out
      end
    else
      @scores << player
      File.open('high_score_list.yaml', 'w') do |out|
        YAML.dump scores.to_yaml, out
      end
    end        
  end

  #this method check whether a YAML file containing player scores exists. If so, it loads the file and adds each player's name, score and date as a row in the high score table.
  def list_display
    if File.file?('high_score_list.yaml')
      @scores = YAML.load_file('high_score_list.yaml')
      rows = []
      table = Terminal::Table.new :title => "Coder Academy - The Game: High Scores".blue, :headings => ['Player Name'.blue, 'Date'.blue, 'Total Score'.blue], :rows => rows
      scores.each do |entry|
        rows << entry
      puts table
      gets
      end
    else
      puts "No scores to display - begin your game to add the first high score!".green 
      gets
    end
  end

end