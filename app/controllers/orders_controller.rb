require_relative '../views/orders_view'

class OrdersController
  def initialize(meal_repository,
                 customer_repository,
                 employee_repository,
                 order_repository)
    @order_repository = order_repository
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @view = OrdersView.new
  end

  def create
    # ask user for meal
    # ask user for customer
    # ask user for employee (rider)
    # create Order
    # save in repository
    meal = select_meal
    customer = select_customer
    rider = select_rider
    order = Order.new(meal: meal, customer: customer, employee: rider)
    @order_repository.add(order)
    rider.add_order(order)
  end


  def list_undelivered
    undelivered = @order_repository.all_undelivered
    @view.display(undelivered)
  end

  def list_my_undelivered(employee)
    undelivered = employee.undelivered_orders
    @view.display(undelivered)
  end

  private

  def select_meal
    meals = @meal_repository.all
    MealsView.new.display(meals)
    meal_index = @view.ask_for_index('meal')
    meals[meal_index]
  end

  def select_customer
    customers = @customer_repository.all
    CustomersView.new.display(customers)
    customer_index = @view.ask_for_index('customer')
    customers[customer_index]
  end

  def select_rider
    riders = @employee_repository.riders
    @view.display_riders(riders)
    rider_index = @view.ask_for_index('rider')
    riders[rider_index]
  end
end
