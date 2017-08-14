
def end_of_game(character)  
  system 'clear'
  puts "Put some text here"
  
  puts "\nEnter to continue...".blue
  gets
  end_game_menu(character)
end

def high_scores_add(character)

end

def end_game_menu(character)
    high_score_list = HighScoreList.new
    high_score_list.add_score(character.name, character.findscore)
    system 'clear'
    puts "  CODER ACADEMY  ".black.on_cyan
    puts "Congratulations on completing Coder Academy, #{character.name}!".green
  
    puts "\n1. Epilogue... Class of #{Time.new.year} \n2. View high scores! \n3. Game credits \n4. Exit game".blue
    literal_response = gets.strip
    response = literal_response.to_i
  
    case response
      when 1
        class_of_year(character)
      when 2
        high_score_list.list_display
        end_game_menu(character)
      when 3
        game_credits_flow(character)
      when 4
        welcome_menu
      else
        puts "\nI don't know what you mean by '#{literal_response}'?".red
        puts "\nPress enter to try again...".red
        gets
      end_game_menu(character)
    end
    
end

def class_of_year(character)
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
    "Barbara Grosz went on to specialise in natural language processing and multi-agent systems. She developed some of the earliest computer dialogue systems and established the research field of computational modelling of discourse."
  ]
  system 'clear'
  puts "\nClass of #{Time.new.year} ...\n".black.on_cyan
  where_are_they_now.each do |i|
    puts "#{where_are_they_now[i]}\n".green
    puts "...".blue
    gets
  end
  puts "\nEnter to continue...".blue
  gets
  end_game_menu(character)

end

def game_credits_flow(character)
  game_credits = [
    "ASCII art courtesy of Andreas Freise: (http://www.ascii-art.de)", 
    "Computer scientist biographies courtesy of Wikiedia (https://en.wikipedia.org)",
    "This program was created in Ruby for the course requirements for Coder Academy Fast Track, semester 2 2017. It was programmed by: Simon Dwyer, Nathaniel Mether, George, Nisval",
    "Thank you to our teachers: Patrick Smith, Matt Matt McKenzie and Reugen Aschenbrenner",
    "And to all those computer scientists, coders and hackers who paved the way..."
  ]

  system 'clear'
  puts "   CODER ACADEMY  ".black.on_cyan
  puts "     The game".cyan
  game_credits.each do |i|
    puts "\n#{game_credits[i]}".green
    sleep 1
  end

  puts "\nEnter to continue...".blue
  gets
  end_game_menu(character)
end

def final_job(character)
  final_score = character.findscore
  case final_score
    when
      job = "Google - the future is yours!"
    when
      job = "Facebook - the pay is good and it turns out Zuckerberg is an OK dude."
    when
      job = "Atlassian, one of Australia's fastest growing startups. You are considered an promising Junior Dev!"
    when
      job = "a new start up called OzBiz. Your pay is ordinary but you got options in the company! Let's hope it lasts till the float..."
    when
      job = "Commonwealth Bank working with their dev team. A solid job with good pay."
    when
      job = "working on HTML as Jim's Websites franchise. Well, at least you get to be your own boss, right?"
    when
      job = "the local coucil doing data entry. It's $24 an hour, but you get all the coffee you can drink."
    when
      job = "at Woolworths working on the checkouts. On the plus side, you get double time on Sundays."
  end
end
