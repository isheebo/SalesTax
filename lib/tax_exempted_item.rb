require_relative "./item.rb"

class TaxExemptedItem < Item
  def sales_tax
    0
  end
end
