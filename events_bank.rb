class DataBank
  
  attr_accessor :events, :class_mates, :past_class_mates, :name

  def initialize
    @events = [ 
      {
        test: "You notice that classmate #{name} is having trouble understanding something and getting a bit upset. Do you: ",
        options: [["Stop your coding and offer to help your classmate to understand.", 8, 2], ["Give your classmate a non-threatening pat on the back, but quickly return to your own coding.", 2, 8], ["Grab a coffee."]]
      },
      {
        test: "Classmate #{name} asks you for help with a tricky coding problem. Do you: ",
        options: [["Stop your coding and help immediately", 7, 3], ["Politely make an excuse and continue with your own work.", -2, 12], ["Apologise as you were just on your way to grab a coffee!"]]
      },
      {
        test: "Classmate #{name} proudly shows off the work done on 'Netbix', a text-based biscuit review application, and invites you to have a go. Do you: ",
        options: [["Spend a lot of time using 'Netbix' and congratulate heartily!", 10, 0], ["Nod politely, clear your throat and resume coding.", 0, 10], ["Indicate that you'd love to have a go - once you've finished your coffee."]]
      },
      {
        test: "You're on a roll with Ruby and learning quickly when a friend calls to invite you to a Junior Developer industry social event. Do you: ",
        options: [["Slam shut your computer and brush your teeth - we're going out!", 8, 2], ["Tell your friend that you're going through a tunnel, put your phone on silent and get back to that code.", -1, 9], ["Tell your friend that you can't make it, sigh, then head for the kitchen for your fifth cup of International Roast."]]
      },
      {
        test: "You find a great Ruby book at your local shop, but it costs $30! Do you: ",
        options: [["Walk right out of there - you're going to spend that $30 on beers with some new developers you met!", 7, 3], ["Book? Ruby? This is what you live for. You smugly reach for your credit card.", 0, 10], ["Are you kidding? You have a $20 a day coffee habit to support."]]
      },
      {
        test: "One of your classmates, #{name}, suggests that you collaborate on a project together. Unfortunately, the project is a bit basic and won't really test your skills. Do you: ",
        options: [["Accept the offer - you'll get the chance to refresh your funadmental skills and help your classmate.", 6, 4], ["Apologise and indicate that you're too busy. You can better spend this time working on your highly sophisticated text-based RPG project.", -3, 13], ["You might be able to help later, but right now you need a coffee."]]
      },
      {
        test: "#{teacher_name} is impressed by your work and asks you to sit next to #{name} who is struggling. Do you: ",
        options: [["Agree. You enjoy helping people and explaining things helps you to understand better. Plus they lent you some cutlery that time when you forgot to bring a fork.", 5, 5], ["Yeeeaannah. You've got work to do and don't want n00bs holding you up", -5, 15], ["No time to save seats, you've got to make an espresso run."]]
      },
      {
        test: "#{name} keeps interupting #{teacher_name} during class. Do you: ",
        options: [["Raise your hand and ask for them to be removed from class.", 18, -8], ["Wait till break time and have a quiet word.", 10, 0], ["You can't hear anyway, might as well grab a cappuccino."]]
      },
      {
        test: "#{name} asks you to attend a ruby meetup with him",
        options: [["Accept and attend the meetup with #{name}", 10, 5], ["Decline #{name} offer and work on your personal project", -5, 10], ["Screw this I want coffee"]]
      },
      {
        test: "#{teacher_name} makes a typo during their code demo",
        options: [["Yell out 'YOU MADE A MISTAKE RIGHT THERE!'", -8, 2], ["Stay quiet and keep it to yourself.....", -2, 5], ["You hear quiet yet alluring voices in your head asking for coffee, you succumb to the voices and get coffee"]]
      },
      {
        test: "You're busy progamming the next Tinder when Nisal suddenly has a massive coughing fit",
        options: [["Let him die and continue your work, you need to build an empire!", -15, 10], ["You rush over to Nisal and help him out, you know he'll be forever in your debt for this good deed.", 15, 0], ["Nisal looks desperately into your eyes but... You really need some caffeine in you right now, to SmoothMe!"]]
      },
      {
        test: "You are just sitting coding away, then you notice that #{name} has something on their face!!!",
        options: [["Ignore it and code away... But it is still there in the back of your mind", 0, -2], ["You loudly point it out to them and make them feel embarrassed",  -5, 0], ["You realize the thing on their face kind of looks like a cup of coffee... Mmmmmm.. Coffee.."]]
      },
      {
        test: "The room is silent. Everyone is working hard their projects. All of a sudden you feel a big sneeze coming...",
        options: [["Hold on your sneeze but now you can't concentrate on your work", 2, -4], ["You let out the biggest sneeze of the century, loud as thunder, everybody is disorientated",  -5, 4], ["All these sneezing is making me thirsty for some coffee"]]
      },
      {
        test: "You hit a mental road block while coding and now you are doubting whether you can even handle the course",
        options: [["Cry", -4, -4], ["Ask for help", 5, 5], ["Go for a walk and get some coffee"]]
      },
      {
        test: "Your train gets delayed in the morning and it's looking like you'll be late to class",
        options: [["Call an uber to get their in time", 4, 4], ["Wait for the train, but get some more coding done", 0, 6], ["Whip out your coffee mug and instant coffee from your bag"]]
      },
      {
        test: "You were having drinks last night, gettin fkn rowdy, but now you are finding it difficult to concentrate on your code...",
        options: [["Charm the person next to get them to let you copy their work, you got this!", 6, -4], ["Meditate to clear your mind. Ommmmmmmm", 0, 4], ["Coffee was made for this!"]]
      },
      {
        test: "Mark Zuckerburg has come in today to give the class a talk, but you feel an itch to code right now...",
        options: [["Listen to his speech and be enligted", 10, 5], ["Code away like a mad man", 0, 5], ["I could listen and code at the same time if I go get some coffee..."]]
      },
      {
        test: "A wild Ruegen appeared!",
        options: [["Test your coding skills in battle and try to catch it", 0, 15], ["Make friends with this magestic creature, you never know when you might need a Ruegen", 5, 6], ["Leave him alone in the wild and go get some coffee"]]
      },

    ]
  end

  #random student name generator for use in event scripts
  def name
    class_mates = ["Jean Bartik", "John Backus", "Kathleen Booth" ,"Alan Turing","Barbara Grosz" ,"Charles Babbage", "Grace Hopper" ,"Tim Berners-Lee", "Ada Lovelace", "Richard Stallman"]
    past_class_mates = [] #an array to ensure that the same name is not re-used during a daily cycle
    name_generated = class_mates.sample
    if past_class_mates.include? name_generated
      return name #this calls upon the same method to pick a different name in the event it has already been used
    else
      past_class_mates << name_generated #adds the used name to the array
      return name_generated
    end
  end

  def teacher_name
    teachers = ["Reugen", "Patrick", "Matt"]
    past_teachers = [] #an array to ensure that the same name is not re-used during a daily cycle
    name_generated = teachers.sample
    if past_teachers.include? name_generated
      return name #this calls upon the same method to pick a different name in the event it has already been used
    else
      past_teachers << name_generated #adds the used name to the array
      return name_generated
    end
  end

end