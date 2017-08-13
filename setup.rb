def setup_character

  system 'clear'
  print "Please enter your name: ".blue
  user_name = String(gets).strip.capitalize rescue nil
  if user_name.length == 0
    puts "\nYou can't enrol without a name".red
    puts "\nPress enter to continue...\n".blue
    gets
    setup_character
  end
  character = Character.new(user_name)
  character.social = 0
  character.coding_skill = 0
  system 'clear'

  allocation_points = 20


  puts "OK #{user_name}, you have just #{allocation_points.to_s} points to allocate between three natural abilities that will help you on your journey to becoming a programmer: INTELLIGENCE, SOCIAL AWARENESS, PERSISTENCE. And most importantly, RESPONSE TO COFFEE.\n\n".green
  puts "Press enter to continue...".blue
  gets

  def setup_intel(character, allocation_points)
    puts "\nYou have #{allocation_points} points to allocate.\n".green
    print "How many points would you like to allocate to intelligence? This will help to learn to code. ".blue
    intelligence = Integer(gets) rescue nil
    if intelligence == nil
      puts "\nPlease only use whole numbers\nTry again...".red
      setup_intel(character, allocation_points)
    elsif intelligence < 0
      puts "\nYou can't use a negative value...\nTry again...".red
      setup_intel(character, allocation_points)
    end
    allocated_points = intelligence
    if allocated_points > 20    
      failed_allocation(allocated_points)
    end
    character.intellect = intelligence
    setup_social(character, allocation_points, allocated_points)
  end

  def setup_social(character, allocation_points, allocated_points)
    puts "\OK, you have #{allocation_points - allocated_points} points still to allocate.\n".green
    print "How many to social awareness? This will help you become a great team member ".blue
    social_awareness = Integer(gets) rescue nil
    if social_awareness == nil
      puts "\nPlease only use whole numbers\nTry again...".red
      setup_social(character, allocation_points, allocated_points)
    elsif social_awareness < 0
      puts "\nYou can't use a negative value...\nTry again...".red
      setup_social(character, allocation_points, allocated_points)
    end
    allocated_points = allocated_points + social_awareness
    if allocated_points > 20
      failed_allocation(allocated_points)
    end
    character.base_social = social_awareness
    character.original_stats_array
    setup_persistence(character, allocation_points, allocated_points)
  end

  def setup_persistence(character, allocation_points, allocated_points)
    puts "\nYou have #{allocation_points - allocated_points} points remaining.\n".green
    print "How many to persistence? This will determine how much work you do each week. ".blue
    persistence = Integer(gets) rescue nil
    if persistence == nil
      puts "\nPlease only use whole numbers\nTry again...".red
      setup_persistence(character, allocation_points, allocated_points)
    elsif persistence < 0
      puts "\nYou can't use a negative value...\nTry again...".red
      setup_persistence(character, allocation_points, allocated_points)
    end
    allocated_points = allocated_points + persistence
    if allocated_points > 20
      failed_allocation(allocated_points)
    end
    character.persistence = persistence
    setup_coffee(character, allocation_points, allocated_points)
  end

  def setup_coffee(character, allocation_points, allocated_points)
    puts "\n... #{allocation_points - allocated_points} points left ...\n".green
    print "And finally, how responsive are you to coffee? When you drink coffee you'll learn faster! ".blue
    coffee_response = Integer(gets) rescue nil
    if coffee_response == nil
      puts "\nPlease only use whole numbers\nTry again...".red
      setup_coffee(character, allocation_points, allocated_points)
    elsif coffee_response < 0
      puts "\nYou can't use a negative value...\nTry again...".red
      setup_coffee(character, allocation_points, allocated_points)
    end
    allocated_points = allocated_points + coffee_response
    if allocated_points > 20
      failed_allocation(allocated_points)
    end
    character.coffee_response = coffee_response
    # do something
      puts "\n\nSet up successful!".green
      puts "\n\nEnter to start the course!".blue
      gets
      welcome(character)
  end

  setup_intel(character, allocation_points)

end

def failed_allocation(allocated_points)
  system 'clear'
  puts "\n\n\You have allocated #{allocated_points} points. 20 minus #{allocated_points} equals #{20 - allocated_points}".red
  sleep 2
  puts "\n\n\nWell, if you can't count to 20, then perhaps this course is not for you.".red
  puts "\n\nEnter to continue...".blue
  gets
  welcome_menu
end