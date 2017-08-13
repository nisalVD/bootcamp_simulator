def welcome(character) 
  # General welcome info. Hosts starting constants and calls the looping week function
    
  weeks_per_term = 4
  week_no = 1 #class??
  term = 1

  system 'clear'
  puts "Hello #{character.name}, welcome to CODER ACADEMY! \n\nOver the next four terms we are not just going to teach you to code. We are going to teach you what it takes to become junior developer …".green
  puts "\nPress enter to continue...".blue
  gets
  puts "\n… you will need to learn to program, to work as a team, and to be resilient and resourceful.".green
  puts "\nPress enter to continue...".blue
  gets
  puts "\nAnd of course along the way there’ll be plenty of coffee to drink. Do you have what it takes to work at Google, #{character.name}? \n\nAre you ready to start your first week?".green
  puts "\nEnter to continue...".blue
  gets

  week(character, weeks_per_term, week_no, term)
end

def week(character, weeks_per_term, week_no, term)
    system 'clear'
    event_generator = Events.new
    data_source = DataBank.new
    term_week = week_no - ((term - 1) * weeks_per_term)

    # sleep mechanic
    if week_no > 1
      sleep_index = rand(25) + character.sleep # Random number between 0 and 25    
      if sleep_index > 16
        character.social = character.social + 5
        character.coding_skill = character.coding_skill + 5
        sleep_qual = "You are sleeping well. You're feeling happy and over the weekend you've consolidated last week's lessons. +5 points to social and coding!"
      elsif sleep_index < 8 
        sleep_qual = "You are sleeping poorly. You are grumpy and have forgotten some of the things you learned last week. -5 points to social and coding..."
        character.social = character.social - 5
        character.coding_skill = character.coding_skill - 5
      else 
        sleep_qual = "You are sleeping OK."
      end
    end

    puts "\nIt is week #{term_week} of term #{term}. #{sleep_qual}\n".green
    puts daily_events(character.persistence, event_generator, data_source, character)
    week_no = week_no + 1

    milestones(character, weeks_per_term, week_no, term) # in milestones.rb
end

def daily_events(persistence, events, data, character) #generates the boost ('n, being 0, 1 or 2) applied to the minimum daily events (3)
  random_number = rand(21) + persistence
  case random_number
  when 0..6
    events(0, events, data, character)
  when 7..13
    events(1, events, data, character)
  else
    events(2, events, data, character)
  end
end

def events(n, events, data, character) #loops n + 3 events, consitituing one 'week'
  total_events = 3 + n
  total_events.times do
    events.random_event_script(data.events, data.class_mates, character)
  end
end
