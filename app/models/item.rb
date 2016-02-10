class Item < ActiveRecord::Base
  belongs_to :user
  validates :title, :price, :description, :quantity, { :presence => true }
  validates :quantity, :price, :numericality => { :greater_than_or_equal_to => 0}
  # validates :user_id, { :presence => true }
  # put this validation back in once we have a user
end
