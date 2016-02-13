class CreatePurchasedItems < ActiveRecord::Migration
  def change
    create_table :purchased_items do |t|
      t.references :order, index: true
      t.references :item, index: true
      t.integer :quantity
      t.timestamps null: false
    end
  end
end
