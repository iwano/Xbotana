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
  attr_accessible :name, :description, :price, :lot_id, :category_id, :presentation_id, :quantity
  default_scope order: 'products.name ASC'
  
  belongs_to :category
  belongs_to :lot
  belongs_to :presentation
  has_many :cart_product, dependent: :destroy
  
   validates :name, presence: true
   validates :description, presence: true
   validates :price, presence: true
   validates :lot_id, presence: true
   validates :category_id, presence: true
   validates :presentation_id, presence: true
   validates :quantity, presence: true
end
