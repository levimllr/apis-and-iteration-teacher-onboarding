def welcome
  puts ""
  # puts out a welcome message here!
  puts "A long time ago in a galaxy far, far away..."
  sleep(1)
  print "|-o-| "
  blasts = 5
  until blasts == 0
    print "="
    sleep(0.2)
    blasts -= 1
  end
  puts " >o<"
  sleep(1)
  puts "Welcome to the Star Wars Character and Film API Query Program!"
  sleep(1)
  puts("")
end

def get_character_from_user
  # use gets to capture the user's input. This method should return that input, downcased.
  puts "Please enter a character name:"
  puts ""
  char_name = gets.chomp.downcase
  return char_name
end
