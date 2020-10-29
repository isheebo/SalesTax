require_relative "./item"
require_relative "./basic_sales_tax"

class NonCategorized < Item
  def sales_tax
    price * BasicSalesTax.rate
  end
end
