require_relative "./tax_exempted_item.rb"

class Medicine < TaxExemptedItem
  def sales_tax
    0
  end
end
