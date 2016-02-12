class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.boolean :complete, default: false
      t.timestamps null: false
    end
  end
end
