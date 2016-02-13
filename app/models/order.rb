class Order < ActiveRecord::Base
  has_many :purchased_items
  has_many :items, through: :purchased_items
  belongs_to :user

# iterate over Purchased Items/items/price, add up
  def purchase_total
    total = 0
    self.purchased_items.each do |purchased_item|
      total += purchased_item.item.price
    end
    total
  end

end
