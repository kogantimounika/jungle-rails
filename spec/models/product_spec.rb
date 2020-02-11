require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should create a product if all of the validations are true' do
    @category = Category.new(name: "Testing")
    @product = Product.new(name: "Supreme Nas Tee", price_cents: 3500, quantity: 35, :category => @category)
    @product.valid?
    expect(@product.errors.full_messages).not_to eql("can\'t be blank")
    end

    it 'should not create a product if the name is missing' do
    @category = Category.new(name: "Testing")
    @product = Product.new(price_cents: 3500, quantity: 35, :category => @category)
    @product.valid?
    expect(@product.errors.full_messages).to eql(["Name can\'t be blank"])
    end

    it 'should not create a product if the quantity is missing' do
    @category = Category.new(name: "Testing")
    @product = Product.new(name: "Supreme Nas Tee", price_cents: 3500, :category => @category)
    @product.valid?
    expect(@product.errors.full_messages).to eql(["Quantity can\'t be blank"])
    end

    it 'should not create a product if the price is missing' do
    @category = Category.new(name: "Testing")
    @product = Product.new(name: "Supreme Nas Tee", quantity: 35, :category => @category)
    @product.valid?
    expect(@product.errors.full_messages).to eql(["Price cents is not a number", "Price is not a number", "Price can't be blank"])
    end

    it 'should not create a product if the category is missing' do
    @category = Category.new(name: "Testing")
    @product = Product.new(name: "Supreme Nas Tee", price_cents: 3500, quantity: 35)
    @product.valid?
    expect(@product.errors.full_messages).to eql(["Category can\'t be blank"])
    end

  end
end 