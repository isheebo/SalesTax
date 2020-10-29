class Receipt
  attr_reader :items
  def initialize(items)
    @items = items
  end

  def total_sales_tax
    items.sum { |item| item.tax }
  end

  def total_with_taxes
    items.sum { |item| item.price + item.tax }.round(2)
  end

  def all_items
    items.map { |item| per_item(item) }
  end

  def per_item(item)
    "#{item.name}: #{format('%0.2f', (item.price + item.tax))}"
  end

  def print_out
    y = all_items
    y << "Sales Taxes: #{format('%0.2f', total_sales_tax)}" <<
      "Total: #{format('%0.2f', total_with_taxes)}"
    y
  end
end
