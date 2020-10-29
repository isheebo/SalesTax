class Item
  attr_accessor :name, :price, :imported
  def initialize(name, price, imported)
    @name = name
    @price = price
    @imported = imported || false
  end

  def import_tax
    if imported
      ImportDutyTax.rate * price
    else
      0
    end
  end

  def sales_tax; end
end
