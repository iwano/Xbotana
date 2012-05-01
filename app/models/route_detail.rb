# == Schema Information
#
# Table name: route_details
#
#  id         :integer         not null, primary key
#  route_id   :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  order_id   :integer
#

class RouteDetail < ActiveRecord::Base
  attr_accessible :route_id, :order_id
  
  belongs_to :route
  belongs_to :order
  
  validates :route_id, :order_id, presence: true
end
