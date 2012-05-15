# == Schema Information
#
# Table name: cities
#
#  id         :integer         not null, primary key
#  state_id   :integer
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class City < ActiveRecord::Base
  def as_json(options=nil)
    super(options ||
          {:include => { :state => { :only => :name }},  
          only: :name } )
  end
  def to_xml(options=nil)
    super(options ||
          {:include => { :state => { :only => :name }},  
          only: :name } )
  end

  attr_accessible :name, :state_id
  belongs_to :state 
  validates :name, :state_id, presence: true
  
  default_scope order: 'cities.name ASC'
end
