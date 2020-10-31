RSpec.describe TaxCalculator do
  describe "#compute" do
    context "with a Taxable Item" do
      context "when the item is imported" do
        it "returns a sum of import tax and sales tax" do
          item = TaxableItem.new("1 imported bottle of perfume", 27.99, true)
          sales_tax = item.sales_tax
          import_tax = item.price * ImportDutyTax.rate
          total_tax = sales_tax + import_tax

          expect(described_class.new(item).compute).to be_within(0.05).of(total_tax)
        end
      end

      context "when item is sourced locally" do
        it "returns just the item's sales tax" do
          item = TaxableItem.new("1 bottle of perfume", 27.99, false)

          expect(described_class.new(item).compute).to be_within(0.05).of(item.sales_tax)
        end
      end
    end

    context "for a TaxExempted item" do
      context "when item is imported" do
        it "returns only the import tax" do
          item = Book.new("1 book", 12.49, true)
          import_tax = ImportDutyTax.rate * item.price

          expect(described_class.new(item).compute).to be_within(0.05).of(import_tax)
        end
      end

      context "when item is sourced locally" do
        it "no taxes are imposed" do
          item = Book.new("1 book", 12.49, false)
          expect(described_class.new(item).compute.zero?).to eq true
        end
      end
    end

    it "rounds off the taxed amount to the nearest 0.05" do
      item = Book.new("1 book", 12.49, true)
      expect(described_class.new(item).compute % 0.05).to be_within(0.05).of(0)
    end
  end
end
