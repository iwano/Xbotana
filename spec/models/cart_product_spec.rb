# == Schema Information
#
# Table name: cart_products
#
#  id         :integer         not null, primary key
#  product_id :integer
#  user_id    :integer
#  quantity   :integer
#  subtotal   :decimal(, )
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe CartProduct do
  pending "add some examples to (or delete) #{__FILE__}"
end
