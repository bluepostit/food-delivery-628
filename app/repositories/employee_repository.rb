require 'csv'
require_relative '../models/employee'

class EmployeeRepository
  # State
  # - csv file name
  # - employees (array)
  # Behavior
  # - all
  # - ...
  # - load csv

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @employees = []
    load_csv if File.exist?(csv_file_path)
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      @employees << Employee.new(row)
    end
  end
end
