require_relative '../views/customers_view'
require_relative '../models/customer'

class CustomersController
  # State
  # - repo
  # - view
  # Behavior
  # - add a customer
  # - list all customers

  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomersView.new
  end

  def add
    # ask user for customer name
    # ask user for customer address
    # create a Customer instance! with name, address.
    # add customer to repository
    name = @view.ask_for('customer name')
    address = @view.ask_for('customer address')
    customer = Customer.new(name: name, address: address)
    @customer_repository.create(customer)
  end

  def list
    # get all customers from repository
    # display to user via the view
    customers = @customer_repository.all
    @view.display(customers)
  end
end
