class Order < ActiveRecord::Base
  has_many :purchased_items
  has_many :items, through: :purchased_items
  belongs_to :user
end
