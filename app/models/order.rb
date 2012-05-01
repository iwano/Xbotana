# == Schema Information
#
# Table name: orders
#
#  id              :integer         not null, primary key
#  user_id         :integer
#  number_products :integer
#  total           :decimal(, )
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  delivered_date  :date
#  status          :string(255)     default("processing")
#

class Order < ActiveRecord::Base
  attr_accessible :status, :number_products, :total, :delivered_date
  
  belongs_to :user
  has_many :order_details
  has_many :route_details
  
  validates :number_products, :total, :user_id, :status, presence: true
  
end
