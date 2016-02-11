class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.decimal :price
      t.text :description
      t.integer :user_id
      t.string :picture_link, default: "http://s-media-cache-ak0.pinimg.com/236x/2f/d8/11/2fd811ff0cc63d7ced001f5c951d4298.jpg"

      t.timestamps null: false
    end
  end
end
