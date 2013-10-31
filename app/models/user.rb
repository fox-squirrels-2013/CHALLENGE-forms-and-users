class User < ActiveRecord::Base
  validates :name, :email, presence: true#, message: "cannot be blank"
  validates :name, :email, uniqueness: true
  validates :email, format: { with: /\S{2,}@{1}\S{2,}.{1}\S{2,}/ }

  def self.flash_presence_validation_error
    user = User.new
    unless user.valid?
      user.errors.add(:email, "All fields cannot be blank and must be formatted correctly")
      user.errors[:email][3]
    end
  end
  #TODO : Use bcrypt to store hashed passwords and authenticate users
end
