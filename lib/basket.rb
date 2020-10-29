require_relative "./receipt"

class Basket
  attr_reader :basket_items
  def initialize(basket_items)
    @basket_items = basket_items
  end

  def generate_receipt
    Receipt.new(basket_items).print_out
  end
end
