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

  def create(meal)
    meal.id = @next_id
    @next_id += 1
    @meals << meal
    save_csv
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

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << %w[id name price]
      @meals.each do |meal|
        csv << [meal.id, meal.name, meal.price]
      end
    end
  end
end
