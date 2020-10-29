class Basket
  attr_reader :item, :quantity
  def initialize(item, quantity)
    @item = item
    @quantity = quantity
  end

  def total
    item.price * quantity
  end
end
