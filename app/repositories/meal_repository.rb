require 'csv'
require_relative '../models/meal'

class MealRepository
  # State
  # - meals
  # Behavior
  # - add meal
  # - get all meals
  # - load CSV
  # - store CSV

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @meals = []
    load_csv if File.exist?(csv_file_path)
  end

  def all
    @meals
  end

  private

  def load_csv
    csv_options = {headers: :first_row, header_converters: :symbol}
    CSV.foreach(@csv_file_path, csv_options) do |row|
      @meals << Meal.new(row)
    end
  end
end
