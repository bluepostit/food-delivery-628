require_relative 'repositories/meal_repository'

meal_csv_path = 'data/meals.csv'
repo = MealRepository.new(meal_csv_path)
p repo.all
