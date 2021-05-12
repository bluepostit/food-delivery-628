class SessionsView
  # State
  # - none
  # Behavior
  # - display messages
  # - receive input

  def ask_for(thing)
    puts "Please enter your #{thing}"
    gets.chomp
  end

  def welcome(employee)
    puts "Welcome #{employee.username}!"
  end

  def unsuccessful_sign_in
    puts "Incorrect details. Please try again."
  end
end
