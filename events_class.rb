require_relative 'sound'

class Events  

  def initialize
    @past_events = [] #This creates an empty array to keep track of which events (hashes) have already been used.
  end

  def random_event_script(events_bank, class_mates, character)
    random_event = events_bank.sample #this chooses a random event (hash) from the @events (array)
    if @past_events.include? random_event #checks to see if this event has already been used
      return random_event_script(events_bank, class_mates, character) #recursively calls itself until an unused event has been identified.
    else
      @past_events << random_event
    #   system 'clear' 
      puts "____________________________".cyan
      puts "\n#{random_event[:test]}".green
      puts "\nA. ".blue + random_event[:options][0][0].blue
      puts "B. ".blue + random_event[:options][1][0].blue
      puts "C. ".blue + random_event[:options][2][0].blue
      puts user_choice(random_event, character, events_bank)
    end
  end


  def user_choice(random_event, character, events_bank)
    if random_event == events_bank[17]
      response = battle
    else
      response = gets.chomp.downcase
    end

    case response
    when "a"
        character.adjust_social(random_event[:options][0][1]) #returns social points
        character.adjust_coding_skill(random_event[:options][0][2]) #return coding points
        if character.coffee_used == true
            character.coffee_crash
        end
        puts "\nYour social score is now #{character.social.round(1)} and coding score is #{character.coding_skill.round(1)}. Remember to balance your social and coding score!".green
        gets
    when "b"
        character.adjust_social(random_event[:options][1][1])
        character.adjust_coding_skill(random_event[:options][1][2])
        if character.coffee_used == true
            character.coffee_crash
        end
        puts "\nYour social score is now #{character.social.round(1)} and coding score is #{character.coding_skill.round(1)}. Remember to balance your social and coding score!".green
        gets
    when "c" 
        character.coffee_drink
        gets
    else
        puts "You didn't select A, B or C - try again!".red
        user_choice(random_event, character, events_bank)
    end
  end
  
end