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

require 'spec_helper'

describe OrderDetail do
  pending "add some examples to (or delete) #{__FILE__}"
end
