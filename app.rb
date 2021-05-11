require_relative 'router'
require_relative 'app/controllers/meals_controller'
require_relative 'app/repositories/meal_repository'

meal_csv_path = 'data/meals.csv'
meal_repository = MealRepository.new(meal_csv_path)

meals_controller = MealsController.new(meal_repository)
router = Router.new(meals_controller)
router.run
