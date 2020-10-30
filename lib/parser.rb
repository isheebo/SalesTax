require_relative "./food"
require_relative "./book"
require_relative "./medicine"
require_relative "./taxable_item"
require_relative "./basket_item"
require_relative "./basket"

def main
  basket_items = ARGV.map do |line_item|
    create_basket_item(line_item)
  end

  puts generate_receipt(basket_items)
end

def generate_receipt(basket_items)
  Basket.new(basket_items).generate_receipt
end

def create_basket_item(line_item)
  quantity_item_name, price = line_item.split(/at\s+/)
  quantity = quantity_item_name.scan(/\A\d{1}/)[0].to_f
  quantity = 1 if quantity <= 0

  imported = quantity_item_name.match?(/import/i)

  item = if quantity_item_name =~ /chocolate/i
           Food
         elsif quantity_item_name =~ /pills/i
           Medicine
         elsif quantity_item_name =~ /book/i
           Book
         else
           TaxableItem
         end.new(quantity_item_name.strip, price.to_f, imported)

  BasketItem.new(item, quantity)
end

main
