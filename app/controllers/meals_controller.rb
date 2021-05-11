require_relative '../views/meals_view'
require_relative '../models/meal'

class MealsController
  # State
  # - repo
  # - view
  # Behavior
  # - add a meal
  # - list all meals

  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def add
    # ask user for meal name
    # ask user for meal price
    # create a Meal instance! with name, price.
    # add meal to repository
    name = @view.ask_for('meal name')
    price = @view.ask_for_number('meal price')
    meal = Meal.new(name: name, price: price)
    @meal_repository.create(meal)
  end

  def list
    # get all meals from repository
    # display to user via the view
    meals = @meal_repository.all
    @view.display(meals)
  end
end
