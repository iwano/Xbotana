# == Schema Information
#
# Table name: products
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  description     :string(255)
#  price           :decimal(, )
#  category_id     :integer(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  quantity        :integer
#  presentation_id :integer
#  lot_id          :integer
#

class Product < ActiveRecord::Base
  def as_json(options=nil)
    super(options ||
          {:include => { :category => { :only => :name }, 
          :presentation => { :only => :name},
          :lot => { :only => :number}}, 
          except:[:created_at, :updated_at, :id, :category_id, :lot_id, :presentation_id] } )
  end
  def to_xml(options=nil)
    super(options ||
          {:include => { :category => { :only => :name }, 
          :presentation => { :only => :name},
          :lot => { :only => :number}}, 
          except:[:created_at, :updated_at, :id, :category_id, :lot_id, :presentation_id] } )
  end
  attr_accessible :name, :description, :price, :lot_id, :category_id, :presentation_id, :quantity
  
  belongs_to :category
  belongs_to :lot
  belongs_to :presentation
  has_many :cart_product, dependent: :destroy
  has_many :order_details
  
   validates :name, presence: true
   validates :description, presence: true
   validates :price, presence: true
   validates :lot_id, presence: true
   validates :category_id, presence: true
   validates :presentation_id, presence: true
   validates :quantity, presence: true
   
   default_scope order: 'products.name ASC'
end
