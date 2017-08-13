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
  