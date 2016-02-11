class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      # don't think this is necessary
      # t.references :item, index: true
      t.string :name

      t.timestamps null: false
    end

    create_table :categories_items, id: false do |t|
      t.references :category, index: true
      t.references :item, index: true
    end

  end
end
