# == Schema Information
#
# Table name: order_details
#
#  id         :integer         not null, primary key
#  order_id   :integer
#  product_id :integer
#  quantity   :integer
#  subtotal   :decimal(, )
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class OrderDetail < ActiveRecord::Base
  attr_accessible :product_id, :quantity, :subtotal
  belongs_to :order
  belongs_to :product
  
  validates :product_id, :quantity, :subtotal, :order_id presence:true
end
