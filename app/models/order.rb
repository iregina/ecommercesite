class Order < ActiveRecord::Base
  has_many :purchased_items
  has_many :items, through: :purchased_items
  belongs_to :user

# iterate over Purchased Items/items/price, add up
  def purchase_total
    total = 0
    self.purchased_items.each do |purchased_item|
      total += (purchased_item.item.price * purchased_item.quantity)
    end
    total
  end

  def check_out
    complete_ready = true
    self.purchased_items.each do |purchased_item|
      if purchased_item.quantity <= purchased_item.item.quantity
        item_to_change = Item.find(purchased_item.item.id)
        new_quantity = purchased_item.item.quantity - purchased_item.quantity
        item_to_change.update(quantity: new_quantity)
        item_to_change.save
      else
        complete_ready = false
      end
    end
    current_order = Order.find(self.id)
    current_order.update(complete: complete_ready)
    # p "*********************************"
    # p current_order.complete
    # p "*********************************"
    current_order.save
  end


end
