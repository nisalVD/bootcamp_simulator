
def end_of_game(character)  
    final_score = character.findscore
    high_score_list = HighScoreList.new
    high_score_list.add_score(character, final_score)
    
    case
      when final_score > 200
        job = "Google!"  
        job_text = "Flying cars, aritifical intelligence, access to the personal data of every person in theworld... the future is yours!"
      when final_score > 150
        job = "Facebook!" 
        job_text = "The pay is good and it turns out Zuckerberg is an OK dude!"
      when final_score > 100
        job = "Atlassian, one of Australia's fastest growing startups." 
        job_text = "You are considered a promising Junior Dev!"
      when final_score > 80
        job = "a new start up called OzBiz." 
        job_text = "Your pay is ordinary but you got options in the company! Let's hope it la sts till the float..."
      when final_score > 60
        job = "Commonwealth Bank working with their dev team." 
        job_text = "A solid job with good pay."
      when final_score > 40
        job = "working on HTML as Jim's Websites franchise." 
        job_text = "Well, at least you get to be your own boss, right?"
      when final_score > 30
        job = "the local coucil doing data entry." 
        job_text = "It's $24 an hour, but you get all the coffee you can drink."
      when final_score <= 30
        job = "at Woolworths working the checkouts." 
        job_text = "On the plus side, you get double time on Sundays."
    end

  system 'clear'
  puts "After a gruelling course, your final coding ability is #{character.coding_skill.round(1)} and your social skill is #{character.social.round(1)}. You calculated developer rating is...#{final_score}".green
  puts "\nYou got a job at #{job}".cyan
  puts "...\n#{job_text}".cyan 
  puts "\nEnter to continue...".blue
  victory
  end_game_menu(character, job)
end

def end_game_menu(character, job)
    high_score_list = HighScoreList.new 
    system 'clear'
    puts "  CODER ACADEMY  ".black.on_cyan
    puts "\nCongratulations on completing Coder Academy, #{character.name}! You got a job at #{job}".green
  
    puts "\n1. Epilogue... Class of #{Time.new.year} \n2. View high scores! \n3. Game credits \n4. Exit game".blue
    literal_response = gets.strip
    response = literal_response.to_i
  
    case response
      when 1
        class_of_year(character, job)
      when 2
        high_score_list.list_display
        gets
        end_game_menu(character, job)
      when 3
        game_credits_flow(character, job)
      when 4
        welcome_menu
      else
        puts "\nI don't know what you mean by '#{literal_response}'?".red
        puts "\nPress enter to try again...".red
        gets
      end_game_menu(character, job)
    end
    
end

def class_of_year(character, job)
  where_are_they_now = [
    "Charles Babbage (1791 – 1871) went on to be credited with inventing the first mechanical computer that eventually led to more complex electronic designs. All the essential ideas of modern computers are to be found in Babbage's analytical engine.",
    "Ada Lovelace (1815 – 1852) went on to be the first to recognise that Charles Babbage’s mechanical computer had applications beyond pure calculation, and created the first algorithm intended to be carried out by such a machine. As a result, she became regarded as the first to recognise the full potential of a 'computing machine' and the first computer programmer.",
    "Grace Hopper (1906 – 1992) went on to be one of the first programmers of the Harvard Mark I computer. She became a pioneer of computer programming, inventing one of the first compiler related tools. She popularized the idea of machine-independent programming languages, which led to the development of COBOL, an early high-level programming language.",
    "Alan Turing (1912 – 1954) went on to provide a formalisation of the concepts of algorithm and computation with the Turing machine, which can be considered a model of a general purpose computer. Turing became widely considered to be the father of theoretical computer science and artificial intelligence.",
    "Kathleen Booth (born 1922) went on to write the first assembly language and to design the assembler and autocode for the first computer systems at Birkbeck College, University of London.",
    "John Backus (1924 – 2007) went on to direct the team that invented and implemented FORTRAN, the first widely used high-level programming language. He was also the inventor of the Backus–Naur form (BNF), a widely used notation to define formal language syntax.",
    "Jean Bartik (1924 – 2011) went on to work on the ENIAC at the University of Pennsylvania. Since it was one of the first computers of its time, she developed and codified many of the fundamentals of programming.",
    "Richard Stallman (born 1953) went on to campaign for software to be distributed in a manner such that its users receive the freedoms to use, study, distribute and modify that software. Stallman eventually launched the GNU Project, founded the Free Software Foundation, developed the GNU Compiler Collection and GNU Emacs, and wrote the GNU General Public License.",
    "Tim Berners-Lee (born 1955) went on to invent of the World Wide Web. He implemented the first successful communication between a Hypertext Transfer Protocol (HTTP) client and server via the internet in mid-November 1989.",
    "Barbara Grosz went on to specialise in natural language processing and multi-agent systems. She developed some of the earliest computer dialogue systems and established the research field of computational modelling of discourse.",
  ]

  system 'clear'
  puts "\nClass of #{Time.new.year} ...\n".black.on_cyan
  i = 0
  where_are_they_now.each do |class_mate|
    puts "#{where_are_they_now[i]}\n".green
    puts "...".blue
    i = i + 1
    gets
  end
  puts "\nEnter to continue...".blue
  gets
  end_game_menu(character, job)

end

def game_credits_flow(character, job)
  game_credits = [
    "This program was created in Ruby for the course requirements for Coder Academy Fast Track, semester 2 2017. It was programmed by: Simon Dwyer, Nathaniel Mether, George, Nisal Don",
    "Thank you to our teachers: Patrick Smith, Matt McKenzie and Reugen Aschenbrenner",
    "ASCII art courtesy of Andreas Freise: (http://www.ascii-art.de)", 
    "Computer scientist biographies courtesy of Wikiedia (https://en.wikipedia.org)",
    "Thank you to all those computer scientists, coders and hackers who paved the way..."
  ]

  system 'clear'
  puts "   CODER ACADEMY  ".black.on_cyan
  puts "     The game".cyan
  i = 0
  game_credits.each do |item|
    puts "\n --- #{game_credits[i]}\n".green
    i = i + 1
    sleep 2
  end

  puts "\nEnter to continue...".blue
  gets
  end_game_menu(character, job)
end


