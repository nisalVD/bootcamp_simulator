first_event = {
  test: "Classmate asks you for help with their code. Do you: \n",
  options: [["Stop your coding and help help immediately", 8, 2], ["Politely decline and focus on your own coding.", -2, 12], ["Drink Coffee"]]
}

def event_script(array)
  puts array[:test]
  puts "A. " + array[:options][0][0]
  puts "B. " + array[:options][1][0]
  puts "C. " + array[:options][2][0]
end

def user_choice(array)
  response = gets.chomp.downcase
  case response
  when "a"
    return array[:options][0][1, 2]
  when "b"
    return array[:options][1][1, 2]
  else 
    return "coffee"
  end
end

puts event_script(first_event)
puts user_choice(first_event)
