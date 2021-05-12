require_relative 'app/repositories/employee_repository'
require_relative 'app/repositories/customer_repository'
require_relative 'app/repositories/order_repository'
require_relative 'app/repositories/meal_repository'

# Customer CSV, repository
customer_csv_path = 'data/customers.csv'
customer_repository = CustomerRepository.new(customer_csv_path)

# Meal CSV, repository
meal_csv_path = 'data/meals.csv'
meal_repository = MealRepository.new(meal_csv_path)

employee_csv_path = 'data/employees.csv'
employee_repository = EmployeeRepository.new(employee_csv_path)

order_csv_file_path = 'data/orders.csv'
repo = OrderRepository.new(order_csv_file_path,
                           meal_repository,
                           customer_repository,
                           employee_repository)
p repo.orders.first
