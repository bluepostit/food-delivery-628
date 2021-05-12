require 'csv'
require_relative '../models/order'

class OrderRepository
  # State
  # - csv file name
  # - orders (array)
  # Behavior
  # - all
  # - find order by id
  # - load csv
  # - save csv

  def initialize(csv_file_path,
                 meal_repository,
                 customer_repository,
                 employee_repository)
    @csv_file_path = csv_file_path
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository

    @orders = []
    @next_id = 1
    load_csv if File.exist?(csv_file_path)
  end

  def find_by_username(username)
    @orders.find { |employee| employee.username == username }
  end

  def create(order)
    order.id = @next_id
    @next_id += 1
    @orders << order
    save_csv
  end

  def all
    @orders
  end

  def undelivered_orders
    @orders.reject { |order| order.delivered? }
  end

  def deliver(order)
    order.deliver!
    save_csv
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      order = build_order(row)
      @orders << order
    end
    @next_id = @orders.last.id + 1 if @orders.any?
  end

  def build_order(row)
    row[:id] = row[:id].to_i
    row[:delivered] = row[:delivered] == 'true'

    row[:meal] = @meal_repository.find(row[:meal_id].to_i)
    row[:customer] = @customer_repository.find(row[:customer_id].to_i)
    employee = @employee_repository.find(row[:employee_id].to_i)
    row[:employee] = employee

    order = Order.new(row)
    employee.add_order(order)
    order
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << %w[id meal_id customer_id employee_id delivered]
      @orders.each do |order|
        csv << [order.id, order.meal.id, order.customer.id,
                order.employee.id,
                order.delivered? ? 'true' : 'false']
      end
    end
  end
end
