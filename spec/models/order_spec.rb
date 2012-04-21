# == Schema Information
#
# Table name: orders
#
#  id              :integer         not null, primary key
#  user_id         :integer
#  number_products :integer
#  total           :decimal(, )
#  delivered       :boolean         default(FALSE)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  delivered_date  :date
#

require 'spec_helper'

describe Order do
  pending "add some examples to (or delete) #{__FILE__}"
end
