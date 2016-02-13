require 'bcrypt'

class User < ActiveRecord::Base
  has_many :items
  has_many :orders

  validates :username, :email, :password_hash, { :presence => true }
  validates :email, { :uniqueness => true }

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(password)
    self.password == password
  end

  # def self.authenticate(email, password)
  #   user = User.find_by(email: email)
  #   return user if user && user.password == password
  # end

end
