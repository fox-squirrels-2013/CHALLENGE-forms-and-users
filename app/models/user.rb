class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  #TODO: Add validations for name, email
  #TODO : Use bcrypt to store hashed passwords and authenticate users
end
