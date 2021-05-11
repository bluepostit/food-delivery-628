class MealsView
  # State
  # - none
  # Behavior
  # - display messages
  # - receive input

  def display(meals)
    meals.each do |meal|
      puts "- #{meal.name} - #{meal.price}€"
    end
  end
end
