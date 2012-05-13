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
  after_create :new_order_notification

  attr_accessible :status, :number_products, :total, :delivered_date
  
  belongs_to :user
  has_many :order_details
  has_many :route_details
  
  validates :number_products, :total, :user_id, :status, presence: true
  
  
  scope :processing, where(:status=>"processing") 

  scope :recent, lambda{ where('created_at > ?', 1.months.ago)}
  scope :recent_client, lambda{ where('created_at > ?', 2.months.ago)}

  private
  	def new_order_notification
  		UserMailer.new_order_placed(self).deliver
    	UserMailer.new_order(self).deliver
  	end
end
