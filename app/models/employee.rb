class Employee
  # State
  # - username
  # - password
  # - role
  # Behavior

  attr_reader :username, :password, :role, :orders
  attr_accessor :id

  def initialize(attr = {})
    @id = attr[:id]
    @username = attr[:username]
    @password = attr[:password]
    @role = attr[:role]
    @orders = []
  end

  def add_order(order)
    @orders << order
  end

  def undelivered_orders
    @orders.reject { |order| order.delivered? }
  end

  def manager?
    @role == 'manager'
  end

  def rider?
    @role == 'rider'
  end
end
