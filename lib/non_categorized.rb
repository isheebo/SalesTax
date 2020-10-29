class NonCategorized < Item
  def sales_tax
    price * BasicSalesTax.rate
  end
end
