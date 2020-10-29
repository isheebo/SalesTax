def main
  ARGV.map do |line_item|
    create_cart_item(line_item)
  end
end

def create_cart_item(line_item)
  quantity_item_name, price = line_item.split(/at\s+/)
  quantity = quantity_item_name.scan(/\A\d{1}/)[0].to_f
  imported = quantity_item_name.match?(/import/i)
  hsh = { price: price.to_f, quantity: quantity.to_f, imported: imported }
  p hsh

  klass = if quantity_item_name =~ /chocolate/i
            Food
          elsif quantity_item_name =~ /pills/i
            Medicine
          elsif quantity_item_name =~ /book/i
            Book
          else
            NonCategorized
          end.new
  p klass.class
end

main
