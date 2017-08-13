require 'colorize'
require 'pry'

require_relative 'setup'
require_relative 'weeks'
require_relative 'end_game'
require_relative 'events_bank'
require_relative 'character'
require_relative 'events_class'

def welcome_menu
  system 'clear'
  puts "\n\n    =CODER ACADEMY=    ".black.on_cyan
  puts " 
 .____________________.
 | __________________ |
 | I                I |
 | I  ".green+"..The Game..".cyan+"  I |
 | I                I |
 | I________________I |
 !____________________!
     ._[________]_.
.____|____________|____.
|::: ____              |
|    ~~~~     [-----]  |
!______________________!\n".green

  puts "\n1. Start new game \n2. Exit".blue
  literal_response = gets.strip
  response = literal_response.to_i

#Make exit messages and invalid messages in new fils for porting

  case response
    when 1
      setup_character
    when 2
      system 'clear'
      puts "Why leave? Can't hack it?\n\n".red
      abort
    else
      puts "\nHuh?? What do you mean '#{literal_response}'? If this reflects your coding ability, you REALLY need this course.".red
      puts "\n\nPress enter to try again...".red
      gets
      welcome_menu
  end
end  

welcome_menu