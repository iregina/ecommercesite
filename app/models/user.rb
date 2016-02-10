class User < ActiveRecord::Base
  has_many :items
  validates :name, :email, { :presence => true }
  validates :email, { :uniqueness => true }
end
