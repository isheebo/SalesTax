require "forwardable"

class BasketItem
  extend Forwardable
  def_delegators :item, :name, :price, :tax

  attr_reader :item, :quantity
  def initialize(item, quantity)
    @item = item
    @quantity = quantity
  end
end
