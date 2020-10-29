require_relative "./import_duty_tax"
require_relative "./tax_calculator"

class Item
  attr_accessor :name, :price, :imported
  def initialize(name, price, imported)
    @name = name
    @price = price
    @imported = imported || false
  end

  def tax
    TaxCalculator.new(self).compute
  end

  protected

  def sales_tax
    raise NotImplementedError
  end
end
