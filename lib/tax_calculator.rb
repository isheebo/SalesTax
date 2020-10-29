class TaxCalculator
  attr_reader :item
  def initialize(item)
    @item = item
  end

  def compute
    import_tax + sales_tax
  end

  private

  def import_tax
    if item.imported
      item.price * ImportDutyTax.rate
    else
      0
    end
  end

  def sales_tax
    item.sales_tax
  end
end
