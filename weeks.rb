require 'colorize'
require_relative 'events_bank'
require_relative 'events_class'

def welcome(character)
    day_no = 1 #class??
    system 'clear'
    puts "Hello #{character.name}, welcome to CODER ACADEMY! \n\nOver the next 27 weeks we are not just going to teach you to code. We are going to teach you what it takes to become junior developer …".green
    puts "\nPress enter to continue...".blue
    gets
    puts "\n…you will need to learn to program, to work as a team, and to be resilient and resourceful.".green
    puts "\nPress enter to continue...".blue
    gets
    puts "\nAnd of course along the way there’ll be plenty of coffee to drink. Do you have what it takes to work at Google? Are you ready to start your first day?".green
    puts "\nEnter to continue...".blue
    gets
    day(character, day_no)
end

def day(character, day_no)
    system 'clear'
    event_generator = Events.new
    data_source = DataBank.new
    sleep_qual = "good"
    puts "\nIt is day #{day_no}. You have had a #{sleep_qual} night's sleep".green
    puts daily_events(character.persistence, event_generator, data_source, character)
    day_no = day_no + 1
    day(character, day_no)
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

def events(n, events, data, character) #loops n + 3 events, consitituing one 'day'
  total_events = 3 + n
  total_events.times do
    events.random_event_script(data.events, data.class_mates, character)
  end
  character.coffee_crash
end