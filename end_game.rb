def end_of_game(character)
  current_year = Time.new.year
  credits = "\nASCII art courtesy of Andreas Freise: (http://www.ascii-art.de) \nComputer scientist biographies courtesy of Wikiedia (https://en.wikipedia.org)\nThis program was created in Ruby for the course requirements for Coder Academy Fast Track. It was programmed by: SImon Dwyer, Nathaniel Mether, George, Nisval"

  system 'clear'
  puts credits
  puts "\nEpilogue...What became of the class of #{current_year}?"
  puts "\nThis is the end of the game.... in end_game.rb"
  gets
end

def high_scores_add(character)
  name = character.name
  coding = character.coding.round(0)
  social = character.social.round(0)
  #total = character.total_score
  job = character.job

  player = {
    name: name,
    coding: coding,
    social: social,
    job: job,
  }

  player_score = HighScore.new(player)
  high_scores.add_score(player_score)
  #high_scores.update_yaml
end

