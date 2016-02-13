class Item < ActiveRecord::Base

  belongs_to :user
  has_many :purchased_items
  has_many :orders, through: :purchased_items
  has_and_belongs_to_many :categories

  validates :title, :price, :description, :quantity, { :presence => true }
  validates :quantity, :price, :numericality => { :greater_than_or_equal_to => 0}

  def has_category?(category)
    self.categories.include? category
  end

  def set_categories(category_hash)
    category_hash.each do |id, check|
      self.categories << Category.find(id) if check == "checked"
    end
  end
  # accepts_nested_attributes_for :categories
  # validates :user_id, { :presence => true }
  # put this validation back in once we have a user
end
