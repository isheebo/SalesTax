require_relative "./tax"

class BasicSalesTax < Tax
  def self.rate
    10.0 / 100
  end
end
