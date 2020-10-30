class BasketItemFactory
  attr_reader :line_item
  def initialize(line_item)
    @line_item = line_item
  end

  def self.create(bskt_item)
    new(bskt_item).send(:generate_item)
  end

  private

  def generate_item
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

  def attrs
    quantity_item_name, price = line_item.split(/at\s+/)
    quantity = quantity_item_name.scan(/\A\d{1}/)[0].to_f
    quantity = 1.0 if quantity <= 0

    imported = quantity_item_name.match?(/import/i)
    { name: quantity_item_name.strip, price: price.to_f, imported: imported, quantity: quantity }
  end
end
