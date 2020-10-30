require_relative "./food"
require_relative "./book"
require_relative "./medicine"
require_relative "./taxable_item"
require_relative "./basket_item"
require_relative "./basket"
require_relative "./basket_item_factory"

class Parser
  attr_reader :items
  def initialize(items)
    @items = items
  end

  def parse
    items.map do |item|
      BasketItemFactory.create(item)
    end
  end
end
