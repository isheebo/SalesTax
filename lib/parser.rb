require_relative "./food"
require_relative "./book"
require_relative "./medicine"
require_relative "./taxable_item"
require_relative "./basket_item"
require_relative "./basket"
require_relative "./basket_item_factory"
require_relative "./errors"

class Parser
  attr_reader :items
  def initialize(items)
    @items = items
  end

  def parse
    line_items.map do |item|
      BasketItemFactory.create(item)
    end
  end

  private

  def line_items
    if items.empty?
      raise EmptyBasketError
    elsif items.any? { |item| item.strip.empty? }
      raise InvalidLineItemError
    else
      items
    end
  end
end
