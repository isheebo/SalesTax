class Receipt
  attr_reader :basket_items
  def initialize(basket_items)
    @basket_items = basket_items
  end

  def print_out
    out = all_items
    out << "Sales Taxes: #{format('%0.2f', total_sales_tax)}"
    out << "Total: #{format('%0.2f', total_amount_plus_tax)}"
    out
  end

  private

  def total_sales_tax
    basket_items.sum { |bt| bt.item.tax * bt.quantity }
  end

  def total_amount_plus_tax
    basket_items.sum { |bt| bt.item.price * bt.quantity }
  end

  def per_item(bskt_item)
    "#{bskt_item.item.name}: #{format('%0.2f', (bskt_item.item.price + bskt_item.item.tax) * bskt_item.quantity)}"
  end

  def all_items
    basket_items.map { |bt| per_item(bt) }
  end
end
