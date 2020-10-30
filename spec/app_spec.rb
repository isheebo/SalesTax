require "spec_helper"
require_relative "../lib/app"
require_relative "../lib/errors"

RSpec.describe Basket do
  inputs = [
    ["1 book at 12.49", "1 music CD at 14.99", "1 chocolate bar at 0.85"],
    ["1 imported box of chocolates at 10.00", "1 imported bottle of perfume at 47.50"], [
      "1 imported bottle of perfume at 27.99",
      "1 bottle of perfume at 18.99",
      "1 packet of headache pills at 9.75",
      "1 box of imported chocolates at 11.25"
    ]
  ]
  outputs = [
    ["1 book: 12.49",
     "1 music CD: 16.49",
     "1 chocolate bar: 0.85",
     "Sales Taxes: 1.50",
     "Total: 29.83"],
    [
      "1 imported box of chocolates: 10.50",
      "1 imported bottle of perfume: 54.65",
      "Sales Taxes: 7.65",
      "Total: 65.15"
    ],
    [
      "1 imported bottle of perfume: 32.19",
      "1 bottle of perfume: 20.89",
      "1 packet of headache pills: 9.75",
      "1 box of imported chocolates: 11.85",
      "Sales Taxes: 6.70",
      "Total: 74.68"
    ]
  ]

  context "when given a valid input" do
    it "generates a receipt" do
      inputs.each_with_index do |input, idx|
        expect(App.new(input).generate_receipt).to match_array outputs[idx]
      end
    end
  end

  context "with an invalid input" do
    context "when given an empty basket" do
      it "raises an error" do
        expect { App.new([]).generate_receipt }.to raise_error(EmptyBasketError)
      end
    end

    context "when the given basket has invalid items (with no names)" do
      it "raises an error" do
        expect { App.new(["1 book at 12.49", "", " "]).generate_receipt }.to raise_error(InvalidLineItemError)
      end
    end
  end
end
