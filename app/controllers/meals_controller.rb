require_relative '../views/meals_view'

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

  def add_meal

  end

  def list
    # get all meals from repository
    # display to user via the view
    meals = @meal_repository.all
    @view.display(meals)
  end
end
