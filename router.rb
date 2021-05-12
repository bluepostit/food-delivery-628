class Router
  # State - controllers
  # Behavior
  # - run
  # - display menu
  # - get user input
  # - dispatch action

  def initialize(meals_controller,
                 customers_controller,
                 sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    while @running
      # log in!
      @employee = @sessions_controller.sign_in
      while @employee
        user_action
      end
    end
  end

  private

  def user_action
      # display the correct menu for the user!
      # if user is a manager, display manager menu
      # else, display rider menu.

    if @employee.manager?
      display_manager_menu
      action = user_choice
      print `clear`
      dispatch_manager_action(action)
    else
      display_rider_menu
      action = user_choice
      print `clear`
      dispatch_rider_action(action)
    end
  end

  def display_manager_menu
    puts '   --- Food Delivery ---'
    puts '1. List all meals'
    puts '2. Add a meal'
    puts '3. List all customers'
    puts '4. Add a customer'
    puts '8. Sign out'
    puts '9. Exit'
  end

  def dispatch_manager_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 8 then @employee = nil
    when 9 then exit
    end
  end

  def display_rider_menu
    puts '   --- Food Delivery ---'
    puts '1. List my undelivered orders'
    puts '2. Deliver an order'
    puts '8. Sign out'
    puts '9. Exit'
  end

  def dispatch_rider_action(action)
    case action
    when 1 then puts 'To do....'
    when 2 then puts 'To do....'
    when 8 then @employee = nil
    when 9 then exit
    end
  end

  def exit
    @employee = nil
    @running = false
  end

  def user_choice
    puts "Please enter your choice:"
    gets.chomp.to_i
  end
end
