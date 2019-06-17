require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do
    before do
      @category = Category.new(:name => "Misc.")
      @product = @category.products.new({
        :name => "Olive Oil",
        :description => "Imported from a remote village near Sicily.",
        :quantity => 100,
        :price => 16
      })
    end

    it "will save successfully valid attributes" do
      @product.save
      expect(@product.errors.full_messages).to be_empty
    end

    it "will not save without a name" do
      @product.name = nil
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "will not save without a price" do
      @product.price_cents = nil
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "will not save without a quantity" do
      @product.quantity = nil
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "will not save without a category" do
      @product.category = nil
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
