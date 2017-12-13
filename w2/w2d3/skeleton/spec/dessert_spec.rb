require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Hayes") }
  let(:cobbler) {Dessert.new("cobbler", 6, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(cobbler.type).to eq("cobbler")
    end
    it "sets a quantity" do
      expect(cobbler.quantity).to eq(6)
    end

    it "starts ingredients as an empty array" do
      expect(cobbler.ingredients).to be_empty
    end


    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new("cake","mmmmm", chef)}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cobbler.add_ingredient("sugar")
      expect(cobbler.ingredients).to include("sugar")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["sugar", "peaches", "butter", "love"]
      ingredients.each do |el|
        cobbler.add_ingredient(el)
      end

      expect(cobbler.ingredients).to eq(ingredients)
      cobbler.mix!
      expect(cobbler.ingredients).not_to eq(ingredients)
      expect(cobbler.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cobbler.eat(2)
      expect(cobbler.quantity).to eq(4)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {cobbler.eat(15)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Hayes the Great Baker")
      expect(cobbler.serve).to eq("Chef Hayes the Great Baker has made 6 cobblers!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cobbler)
      cobbler.make_more
    end
  end
end
