# == Schema Information
#
# Table name: routes
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Route < ActiveRecord::Base
  attr_accessible :user_id
  
  belongs_to :user
  has_many :route_details, dependent: :destroy
  
  validates :user_id, presence:true
end
