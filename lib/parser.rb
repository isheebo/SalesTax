require_relative "./food"
require_relative "./book"
require_relative "./medicine"
require_relative "./taxable_item"
require_relative "./basket_item"
require_relative "./basket"

class Parser
  attr_reader :items
  def initialize(items)
    @items = items
  end

  def parse
    items.map do |item|
      parse_item(item)
    end
  end

  private

  def parse_item(item)
    attrs = extract_attributes(item)
    item = if attrs[:name] =~ /chocolate/i
             Food
           elsif attrs[:name] =~ /pills/i
             Medicine
           elsif attrs[:name] =~ /book/i
             Book
           else
             TaxableItem
           end.new(attrs[:name], attrs[:price], attrs[:imported])
    BasketItem.new(item, attrs[:quantity])
  end

  def extract_attributes(line_item)
    quantity_item_name, price = line_item.split(/at\s+/)
    quantity = quantity_item_name.scan(/\A\d{1}/)[0].to_f
    quantity = 1.0 if quantity <= 0

    imported = quantity_item_name.match?(/import/i)
    { name: quantity_item_name.strip, price: price.to_f, imported: imported, quantity: quantity }
  end
end

def main
  basket_items = Parser.new(ARGV).parse
  puts Basket.new(basket_items).generate_receipt
end

main
