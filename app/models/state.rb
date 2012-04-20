# == Schema Information
#
# Table name: states
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class State < ActiveRecord::Base
  attr_accessible :name 
  has_many :cities, dependent: :destroy
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  
  default_scope order: 'states.name ASC'
end
