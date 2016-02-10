require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item_no_title) { Item.new(price: 10.00, description: 'hi', user_id: 1, quantity: 3) }
  let(:item_no_description) { Item.new(title: 'ball', price: 10.00, user_id: 2, quantity: 3) }
  let(:item_no_price) { Item.new(title: 'cat', description: 'cool', user_id: 3, quantity: 3) }
  let(:item_no_quantity) { Item.new(title: 'sled', price: 50.00, description: 'neat', user_id: 4) }
  let(:item_negative_quantity) { Item.new(title: 'sled', price: 50.00, description: 'neat', user_id: 4, quantity: -5) }

  let(:item) { Item.new(title: 'dog', price: 50.00, description: 'neat', user_id: 4, quantity: 3) }

  describe 'validations' do

    context 'it will raise an error' do

      it 'when the title field is empty' do
        item_no_title.save
        expect(item_no_title.errors[:title]).to include("can't be blank")
      end

      it 'when description field is empty' do
        item_no_description.save
        expect(item_no_description.errors[:description]).to include("can't be blank")
      end

      it 'when the price field is empty' do
        item_no_price.save
        expect(item_no_price.errors[:price]).to include("can't be blank")
      end

# Will not run , due to default setting of 0
      it 'when the quantity field is empty, value defaults to 0' do
        item_no_quantity.save
        expect(item_no_quantity.quantity).to eq(0)
      end

      it 'when the quantity field is negative' do
        item_negative_quantity.save
        expect(item_negative_quantity.errors[:quantity]).to include("must be greater than or equal to 0")
      end

    end
    it 'saves the item when the fields are not blank' do
      expect{item.save}.to change{Item.count}.by(1)
    end
  end
end






# class Item < ActiveRecord::Base
#   belongs_to :user
#   validates :title, :price, :description, :user_id, { :presence => true }
# end
