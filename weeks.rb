require 'colorize'
require_relative 'events_bank'
require_relative 'events_class'

def welcome(character) 
  # General welcome info. Hosts starting constants and calls the looping week function
    
  weeks_per_term = 4
  week_no = 1 #class??
  term = 1

  system 'clear'
  puts "Hello #{character.name}, welcome to CODER ACADEMY! \n\nOver the next four terms we are not just going to teach you to code. We are going to teach you what it takes to become junior developer …".green
  puts "\nPress enter to continue...".blue
  gets
  puts "\n…you will need to learn to program, to work as a team, and to be resilient and resourceful.".green
  puts "\nPress enter to continue...".blue
  gets
  puts "\nAnd of course along the way there’ll be plenty of coffee to drink. Do you have what it takes to work at Google, #{character.name}? \n\nAre you ready to start your first week?".green
  puts "\nEnter to continue...".blue
  gets

  week(character, weeks_per_term, week_no, term)
end

def milestones(character, weeks_per_term, week_no, term)

  # These strings are inserted into the congrats text at the completion of each term
  first_term_syllabus = "Ruby, HTML and CSS"
  second_term_syllabus = "JavaScript and Node.js"
  third_term_syllabus = "React.js, Ruby on Rails and MongoDB"
  fourth_term_syllabus = "how development works in the real world, thanks to a successful internship"

  # conditional for determining end of term text and term count. Called at the end of week function
  case
    when week_no == (1 * weeks_per_term + 1) 
      system 'clear'
      puts "Congratualtions #{character.name}!!\n\nYou have finished term #{term}! You have learned #{first_term_syllabus}.\n\nYour coding score is now #{character.coding_skill}. Your social score is #{character.social}. Keep going!!".green
      puts "\nEnter to continue...".blue
      gets
      puts "   
  ____________
 /   /    \\   \\
/__ /______\\___\\
\\   \\      /   /
 \\   \\    /   /
  \\   \\  /   /
   \\___\\/___/

".cyan
      puts "\nEnter to continue...".blue
      gets
      term = term + 1 # Starts the next term
      week(character, weeks_per_term, week_no, term) 
    when week_no == (2 * weeks_per_term + 1)
      system 'clear'
      puts "Congratualtions #{character.name}!!\n\nYou have finished term #{term}! You have learned #{second_term_syllabus}.\n\nYour coding score is now #{character.coding_skill.round(0)}. Your social score is #{character.social.round(0)}. Maybe you can do this after all!".green
      puts "\nEnter to continue...".blue
      gets
      puts "
                __        
.-----.-----.--|  |.-----.
|     |  _  |  _  ||  -__|
|__|__|_____|_____||_____| _     
                          (_)  ___
                     _    | | (_-<
                    (_)  _/ | /__/
                        |__/      ".cyan                        
      puts "\nEnter to continue...".blue
      gets
      term = term + 1
      week(character, weeks_per_term, week_no, term)
    when week_no == (3 * weeks_per_term + 1)
      system 'clear'
      puts "Congratualtions #{character.name}!!\n\nYou have finished term #{term}! You have learned #{third_term_syllabus}.\n\nYour coding score is now #{character.coding_skill.round(0)}. Your social score is #{character.social.round(0)}. You've got this!!".green
      puts "
                 +????         ????I
                ??    ???   ???    ??
                ??      ?????      :?
                ??      ?I.I?,      ?
                ??   ,?????????,   ??
               ????????        ????????
            ??? ??.??           ??.??  ???
          ??     +???   ?????   ????     ??
         ??       ??=  ???????   ??       ??
          ??~    ??:?   ?????   ?,??    ~??
            ???? ?= ??         ?? ~? ????
              =???????:     ,???????+
                ??    =???????+    ??
                ?       ??.??       ?
                ??      ?? ??      :?
                I?   +??,    ???   ??
                  ????         ????,
".cyan
      puts "\nEnter to continue...".blue
      gets
      term = term + 1
      week(character, weeks_per_term, week_no, term)
    when week_no == (4 * weeks_per_term + 1)
      system 'clear'
      puts "Congratualtions #{character.name}!!\n\nYou have finished term #{term}! You have learned #{fourth_term_syllabus}.\n\nYour coding score is now #{character.coding_skill.round(0)}. Your social score is #{character.social.round(0)}. What now???".green
      puts "\nEnter to continue...".blue
      gets
      end_of_game #calls the end of game function (in end_game file)
    else
      week(character, weeks_per_term, week_no, term)
    end

  end  

def week(character, weeks_per_term, week_no, term)
    system 'clear'
    event_generator = Events.new
    data_source = DataBank.new
    term_week = week_no - ((term - 1) * weeks_per_term)

    # sleep mechanic
    if week_no > 1
      sleep_index = rand(10) # Random number between 0 and 9 ()    
      if sleep_index > 6 # 7,8,9 high, bonus points
        character.social = character.social + 5
        character.coding_skill = character.coding_skill + 5
        sleep_qual = "You are sleeping well and have consolidated what you learned last week. +5 points to social and coding!"
      elsif sleep_index < 3 #0,1,2 low, negative
        sleep_qual = "You are sleeping poorly and have forgotten some of the things you learned last week. -5 points to social and coding..."
        character.social = character.social - 5
        character.coding_skill = character.coding_skill - 5
      else # 3,4,5 middle, no bonus
        sleep_qual = "You are sleeping OK."
      end
    end

    puts "\nIt is week #{term_week} of term #{term}. #{sleep_qual}".green
    puts daily_events(character.persistence, event_generator, data_source, character)
    week_no = week_no + 1

    milestones(character, weeks_per_term, week_no, term)
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

def sleep_mechanic


end