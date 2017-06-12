require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should be valid if product name, price, quantity and category are present' do
      category = Category.new(name: 'apparel')
      product = Product.new(name: 'a', price_cents: 1, quantity: 1, category: category)
      expect(product).to(be_valid)
    end

    it 'should not be valid if name is missing' do
      category = Category.new(name: 'apparel')
      product = Product.new(price_cents: 1, quantity: 1, category: category)
      expect(product).to_not(be_valid)
    end

    it 'should not be valid if price is missing' do
      category = Category.new(name: 'apparel')
      product = Product.new(name: 'a', quantity: 1, category: category)
      expect(product).to_not(be_valid)
    end

    it 'should not be valid if quantity is missing' do
      category = Category.new(name: 'apparel')
      product = Product.new(name: 'a', price_cents: 1, category: category)
      expect(product).to_not(be_valid)
    end

    it 'should not be valid if category is missing' do
      category = Category.new(name: 'apparel')
      product = Product.new(name: 'a', price_cents: 1, quantity: 1)
      expect(product).to_not(be_valid)
    end
  end
end
