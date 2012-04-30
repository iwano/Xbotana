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
#  remember_token  :string(255)
#  admin           :boolean         default(FALSE)
#  state_id        :integer
#  city_id         :integer
#  mobile_phone    :string(255)
#  rfc             :string(255)
#  vendor          :boolean         default(FALSE)
#  hos             :boolean         default(FALSE)
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :phone_number, :address, :state_id, :city_id,
                  :mobile_phone, :rfc, :password, :password_confirmation
  has_secure_password
  before_save :create_remember_token
  
  has_many :cart_products, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :routes
  belongs_to :state
  belongs_to :city
  
  validates :state_id, presence:true
  validates :city_id, presence:true
  validates :rfc, presence:true
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 6 }
  VALID_PHONE_REGEX = /\A[\d+\-.+\()+\s]+\z/
  validates :phone_number, presence: true, format: { with: VALID_PHONE_REGEX }
  validates :mobile_phone, presence: true, format: { with: VALID_PHONE_REGEX }
  validates :address, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
                      
  
  def cart
    CartProduct.where("user_id = ?", id)
  end
  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
