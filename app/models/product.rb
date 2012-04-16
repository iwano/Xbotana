# == Schema Information
#
# Table name: products
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  price       :decimal(, )
#  lot         :integer
#  category_id :integer(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

class Product < ActiveRecord::Base
  attr_accessible :name, :description, :price, :lot, :category_id
  belongs_to :category
   validates :name, presence:true
   validates :description, presence:true
   validates :price, presence:true
   validates :lot, presence:true
   validates :category_id, presence:true
end
