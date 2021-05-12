require_relative '../views/sessions_view'

class SessionsController
  # State
  # - employees repository
  # - sessions view
  # Behavior
  # - sign in

  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionsView.new
  end

  def sign_in
    # Ask user for username
    # Ask user for password
    # Find the employee in the repo with the username
    # If found, check password
    # Otherwise, (error?)
    username = @view.ask_for('username')
    password = @view.ask_for('password')

    employee = @employee_repository.find_by_username(username)
    if employee && employee.password == password
      @view.welcome(employee)
    else
      @view.unsuccessful_sign_in
      sign_in
    end
    employee
  end
end
