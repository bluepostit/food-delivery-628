class OrdersView
  def display(orders)
    orders.each_with_index do |order, index|
      puts "#{index + 1}. #{order.meal.name} @ #{order.customer.name} > " \
        + order.employee.username
    end
  end

  def display_riders(riders)
    riders.each_with_index do |rider, index|
      puts "#{index + 1}. #{rider.username}"
    end
  end

  def clear
    print `clear`
  end

  def ask_for_index(thing)
    puts "Please type the #{thing} number:"
    gets.chomp.to_i - 1
  end
end
