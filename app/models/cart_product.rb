# == Schema Information
#
# Table name: cart_products
#
#  id         :integer         not null, primary key
#  product_id :integer
#  user_id    :integer
#  quantity   :integer
#  subtotal   :decimal(, )
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class CartProduct < ActiveRecord::Base
  attr_accessible :product_id, :quantity, :subtotal, :user_id
  
  belongs_to :product
  belongs_to :user
  
  validates :product_id, :quantity, :subtotal, :user_id, presence: true
end
