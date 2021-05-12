class CustomersView
  # State
  # - none
  # Behavior
  # - display messages
  # - receive input

  def display(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}. #{customer.name} / #{customer.address}"
    end
  end

  def ask_for(thing)
    puts "Please enter the #{thing}"
    gets.chomp
  end

  def ask_for_number(thing)
    ask_for(thing).to_i
  end
end
