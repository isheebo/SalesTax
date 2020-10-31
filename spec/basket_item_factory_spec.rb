RSpec.describe BasketItemFactory do
  describe ".create" do
    context "when given chocolate" do
      it "returns a Food object" do
        expect(described_class.create("1 box of chocolate at 4.99").item).to be_an_instance_of(Food)
      end
    end

    context "when given pills" do
      it "returns a Medicine object" do
        expect(described_class.create("1 dose of headache pills at 2.99").item).to be_an_instance_of(Medicine)
      end
    end

    context "when given a book" do
      it "returns a Book object" do
        expect(described_class.create("1 Animal Farm book at 21.49").item).to be_an_instance_of(Book)
      end
    end

    context "when the item description contains neither book, nor chocolate, nor pills" do
      it "returns an instance of a Taxable object" do
        expect(described_class.create("1 Avengers Movie at 13.99").item).to be_an_instance_of(TaxableItem)
      end
    end
  end
end
