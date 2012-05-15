# == Schema Information
#
# Table name: categories
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Category < ActiveRecord::Base
  def as_json(options=nil)
    super(options ||
          {only: :name } )
  end
  def to_xml(options=nil)
    super(options ||
          {only: :name } )
  end
  attr_accessible :name
  has_many :products, dependent: :destroy
  
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
