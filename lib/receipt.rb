class Receipt
  attr_reader :basket_items
  def initialize(basket_items)
    @basket_items = basket_items
  end

  def print_out
    out = all_items
    out << "Sales Taxes: #{format('%<taxes>.2f', taxes: total_sales_tax)}"
    out << "Total: #{format('%<amount>.2f', amount: total_amount_plus_tax)}"
    out
  end

  private

  def total_sales_tax
    basket_items.sum { |bt| bt.tax * bt.quantity }
  end

  def total_amount_plus_tax
    basket_items.sum { |bt| (bt.price * bt.quantity) + bt.tax }
  end

  def per_item(bskt_item)
    "#{bskt_item.name}: #{format('%<total>.2f', total: (bskt_item.price + bskt_item.tax) * bskt_item.quantity)}"
  end

  def all_items
    basket_items.map { |bt| per_item(bt) }
  end
end
