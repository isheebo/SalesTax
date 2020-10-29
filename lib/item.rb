require_relative "./import_duty_tax"

class Item
  attr_accessor :name, :price, :imported
  def initialize(name, price, imported)
    @name = name
    @price = price
    @imported = imported || false
  end

  def tax
    import_tax + sales_tax
  end

  protected

  def sales_tax
    raise NotImplementedError
  end

  private

  def import_tax
    if imported
      ImportDutyTax.rate * price
    else
      0
    end
  end
end
