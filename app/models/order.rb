# == Schema Information
#
# Table name: orders
#
#  id              :integer         not null, primary key
#  user_id         :integer
#  number_products :integer
#  total           :decimal(, )
#  delivered       :boolean         default(FALSE)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  delivered_date  :date
#

class Order < ActiveRecord::Base
  attr_accessible :delivered, :number_products, :total, :delivered_date
  belongs_to :user
  has_many :order_details
  
  validates :number_products, :total, :user_id, presence:true
  
end
