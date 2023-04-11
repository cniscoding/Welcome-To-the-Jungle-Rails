require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    it 'product with all four fields set will indeed save successfully' do
      @product = Product.new(name: 'bamboo', price_cents: 399, quantity: 16, category: Category.new(name: "branch"))
      expect(@product).to be_valid
    end

    it 'error message when name is NIL' do
      @product = Product.create(name: nil, price_cents: 399, quantity: 16, category: Category.new(name: "branch"))
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'error message when price is NIL' do
      @product = Product.create(name: 'Bamboo', price_cents: nil, quantity: nil, category: Category.new(name: "branch"))
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'error message when quantity is NIL' do
      @product = Product.create(name: 'Bamboo', price_cents: 399, quantity: nil, category: Category.new(name: "branch"))
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'error message when category is NIL' do
      @product = Product.create(name: 'Bamboo', price_cents: 399, quantity: 16, category: nil)
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
