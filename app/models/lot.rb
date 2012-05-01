# == Schema Information
#
# Table name: lots
#
#  id          :integer         not null, primary key
#  number      :integer
#  expiry_date :date
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Lot < ActiveRecord::Base
  attr_accessible :expiry_date, :number
  
  has_many :products, dependent: :destroy
  validates :expiry_date, presence: true
  validates :number, uniqueness: { case_sensitive: false }
  
  default_scope order: 'lots.number ASC'
end
