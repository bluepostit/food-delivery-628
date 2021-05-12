class MealsView
  # State
  # - none
  # Behavior
  # - display messages
  # - receive input

  def display(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.name} - #{meal.price}€"
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
