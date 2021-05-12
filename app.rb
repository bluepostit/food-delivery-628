require_relative 'router'
require_relative 'app/controllers/customers_controller'
require_relative 'app/controllers/meals_controller'
require_relative 'app/controllers/sessions_controller'
require_relative 'app/controllers/orders_controller'

require_relative 'app/repositories/employee_repository'
require_relative 'app/repositories/customer_repository'
require_relative 'app/repositories/order_repository'
require_relative 'app/repositories/meal_repository'

# Customer CSV, repository, controller
customer_csv_path = 'data/customers.csv'
customer_repository = CustomerRepository.new(customer_csv_path)
customers_controller = CustomersController.new(customer_repository)

# Meal CSV, repository, controller
meal_csv_path = 'data/meals.csv'
meal_repository = MealRepository.new(meal_csv_path)
meals_controller = MealsController.new(meal_repository)

# Sessions...
employee_csv_path = 'data/employees.csv'
employee_repository = EmployeeRepository.new(employee_csv_path)
sessions_controller = SessionsController.new(employee_repository)

# Orders...
order_csv_file_path = 'data/orders.csv'
order_repository = OrderRepository.new(order_csv_file_path,
                           meal_repository,
                           customer_repository,
                           employee_repository)
orders_controller = OrdersController.new(meal_repository,
                                         customer_repository,
                                         employee_repository,
                                         order_repository)

router = Router.new(meals_controller,
                    customers_controller,
                    sessions_controller,
                    orders_controller)
router.run
