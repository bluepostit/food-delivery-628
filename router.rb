class Router
  # State - controllers
  # Behavior
  # - run
  # - display menu
  # - get user input
  # - dispatch action

  def initialize(meals_controller)
    @meals_controller = meals_controller
    @running = true
  end

  def run
    while @running
      display_menu
      action = get_user_choice
      print `clear`
      dispatch(action)
    end
  end

  def display_menu
    puts "   --- Food Delivery ---"
    puts "1. List all meals"
    puts "2. Add a meal"
    puts '9. Exit'
  end

  def dispatch(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add_meal
    when 3 then @customers_controller.list
    when 9 then @running = false
    end
  end

  def get_user_choice
    puts "Please enter your choice:"
    gets.chomp.to_i
  end
end
