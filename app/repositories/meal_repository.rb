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
    @next_id = 1
    load_csv if File.exist?(csv_file_path)
  end

  def all
    @meals
  end

  private

  def load_csv
    csv_options = {headers: :first_row, header_converters: :symbol}
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:price] = row[:price].to_i
      row[:id] = row[:id].to_i
      @meals << Meal.new(row)
    end
    @next_id = @meals.last.id + 1 if @meals.any?
  end
end
