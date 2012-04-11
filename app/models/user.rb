# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  phone_number    :string(255)
#  address         :string(255)
#  password_digest :string(255)
#  state           :string(255)
#  city            :string(255)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :phone_number, :address, :state, :city,
                  :password, :password_confirmation
  has_secure_password
  
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 6 }
  validates :city, presence: true, length: { maximum: 20 }
  validates :state, presence: true, length: { maximum: 20 }
  validates :phone_number, presence: true
  validates :address, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
                      
  
end