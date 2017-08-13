require 'colorize'
require 'pry'

require_relative 'setup'
require_relative 'weeks'
require_relative 'milestones'
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

  puts "\n1. Start new game \n2. About Coder Academy \n3. Exit".blue
  literal_response = gets.strip
  response = literal_response.to_i

#Make exit messages and invalid messages in new fils for porting

  contact_dets = "  CODER ACADEMY  ".black.on_cyan + "\n\nCoder Academy bootcamps keep up with the industry's increasing and evolving demand for web developers. Through hands-on, project-based coursework, the Coder Academy immersive, industry relevant education provides a time and cost efficient path to become an employable Junior Developer in only 6 months.\n\nThis game will give you a short taste of the Coder Academy Fast Track course!".green + "\n\nWeb: coderacademy.edu.au\nEmail: info@coderacademy.edu.au".cyan + "\n\n** Sydney **\nPhone: +61 2 8355 3822\nLevel 2, 7 Kelly Street\nUltimo, NSW 2007\n\n** Melbourne **\nPhone: +61 3 8683 7093\nLevel 13, 120 Spencer Street,\nMelbourne, VIC 3000\n\n** Brisbane **\nPhone: +61 7 3638 6707\n120 Brunswick Street,\nFortitude Valley, QLD 4006".green

  case response
    when 1
      setup_character
    when 2
      system 'clear'
      puts contact_dets
      puts "\nEnter to return to main menu...".blue
      gets
      welcome_menu
    when 3
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