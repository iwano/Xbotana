# == Schema Information
#
# Table name: presentations
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Presentation < ActiveRecord::Base
  attr_accessible :name
  has_many :products
  
  validates :name, presence:true, uniqueness: { case_sensitive: false }
end
