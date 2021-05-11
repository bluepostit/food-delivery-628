class Router
  # State - controllers
  # Behavior
  # - run
  # - display menu
  # - get user input
  # - dispatch action

  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    while @running
      display_menu
      action = user_choice
      print `clear`
      dispatch(action)
    end
  end

  def display_menu
    puts '   --- Food Delivery ---'
    puts '1. List all meals'
    puts '2. Add a meal'
    puts '3. List all customers'
    puts '4. Add a customer'
    puts '9. Exit'
  end

  def dispatch(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 9 then @running = false
    end
  end

  def user_choice
    puts "Please enter your choice:"
    gets.chomp.to_i
  end
end
