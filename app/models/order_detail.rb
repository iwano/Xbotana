# == Schema Information
#
# Table name: order_details
#
#  id         :integer         not null, primary key
#  order_id   :integer
#  product_id :integer
#  quantity   :integer
#  subtotal   :decimal(, )
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class OrderDetail < ActiveRecord::Base
  def as_json(options=nil)
    super(options ||
    	{:include => {:product => {
    		:include => { :presentation => {
    			:only => :name}, 
    			:category => {
    				:only => :name},
    				:lot => {
    					:only => :number
    		}}, except:[:created_at, :updated_at, :id, :lot_id, :presentation_id, :category_id, :quantity]}},
    		except:[:created_at, :updated_at, :id, :order_id, :product_id] })        
  end
  attr_accessible :product_id, :quantity, :subtotal
  belongs_to :order
  belongs_to :product
  
  validates :product_id, :quantity, :subtotal, :order_id, presence: true
end
