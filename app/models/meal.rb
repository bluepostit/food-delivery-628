class Meal
  # State
  # - id
  # - name
  # - price
  attr_reader :name, :price

  def initialize(attr = {})
    id = attr[:id]
    name = attr[:name]
    price = attr[:price] || 0
  end
end
