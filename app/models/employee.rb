class Employee
  # State
  # - username
  # - password
  # - role
  # Behavior

  attr_reader :username, :password, :role

  def initialize(attr = {})
    @id = attr[:id]
    @username = attr[:username]
    @password = attr[:password]
    @role = attr[:role]
  end

  def manager?
    @role == 'manager'
  end

  def rider?
    @role == 'rider'
  end
end
