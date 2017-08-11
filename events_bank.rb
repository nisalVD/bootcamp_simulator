class DataBank
  
  attr_accessor :events, :class_mates, :past_class_mates, :name

  def initialize
    @events = [
      first_event = {
        test: "You notice that classmate #{name} is having trouble understanding something and getting a bit upset. Do you: ",
        options: [["Stop your coding and offer to help your classmate to understand.", 8, 2], ["Give your classmate a non-threatening pat on the back, but quickly return to your own coding.", 2, 8], ["Grab a coffee."]]
      },
      second_event = {
        test: "Classmate #{name} asks you for help with a tricky coding problem. Do you: ",
        options: [["Stop your coding and help immediately", 7, 3], ["Politely make an excuse and continue with your own work.", -2, 12], ["Apologise as you were just on your way to grab a coffee!"]]
      },  
      third_event = {
        test: "Classmate #{name} proudly shows off the work done on 'Netbix', a text-based biscuit review application, and invites you to have a go. Do you: ",
        options: [["Spend a lot of time using 'Netbix' and congratulate heartily!", 10, 0], ["Nod politely, clear your throat and resume coding.", 0, 10], ["Indicate that you'd love to have a go - once you've finished your coffee."]]
      },
      fourth_event = {
        test: "You're on a roll with Ruby and learning quickly when a friend calls to invite you to a Junior Developer industry social event. Do you: ",
        options: [["Slam shut your computer and brush your teeth - we're going out!", 8, 2], ["Tell your friend that you're going through a tunnel, put your phone on silent and get back to that code.", -1, 9], ["Tell your friend that you can't make it, sigh, then head for the kitchen for your fifth cup of International Roast."]]
      },
      fifth_event = {
        test: "You find a great Ruby book at your local shop, but it costs $30! Do you: ",
        options: [["Walk right out of there - you're going to spend that $30 on beers with some new developers you met!", 7, 3], ["Book? Ruby? This is what you live for. You smugly reach for your credit card.", 0, 10], ["Are you kidding? You have a $20 a day coffee habit to support."]]
      },
      sixth_event = {
        test: "One of your classmates, #{name}, suggests that you collaborate on a project together. Unfortunately, the project is a bit basic and won't really test your skills. Do you: ",
        options: [["Accept the offer - you'll get the chance to refresh your funadmental skills and help your classmate.", 6, 4], ["Apologise and indicate that you're too busy. You can better spend this time working on your highly sophisticated text-based RPG project.", -3, 13], ["You might be able to help later, but right now you need a coffee."]]
      },
      seventh_event = {
        test: "#{teacher_name} is impressed by your work and asks you to sit next to #{name} who is struggling. Do you: ",
        options: [["Agree. You enjoy helping people and explaining things helps you to understand better. Plus #{name} lent you some cutlery that time when you forgot to bring a fork.", 5, 5], ["Yeeeaannah. You've got work to do and don't want n00bs holding you up", -5, 15], ["No time to save seats, you've got to make an espresso run."]]
      },
      eighth_event = {
        test: "#{name} keeps interupting#{teacher_name} is impressed by your work and asks you to sit next to #{name} who is struggling. Do you: ",
        options: [["Agree. You enjoy helping people and explaining things helps you to understand better. Plus #{name} lent you some cutlery that time when you forgot to bring a fork.", 5, 5], ["Yeeeaannah. You've got work to do and don't want n00bs holding you up", -5, 15], ["No time to save seats, you've got to make an espresso run."]]
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