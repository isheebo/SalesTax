require_relative "./basket"
require_relative "./parser"

class App
  attr_reader :line_items
  def initialize(line_items = ARGV)
    @line_items = line_items
  end

  def generate_receipt
    Basket.new(basket_items).generate_receipt
  end

  private

  def basket_items
    Parser.new(line_items).parse
  end
end

puts App.new(ARGV).generate_receipt
