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

require 'spec_helper'

describe Product do
  pending "add some examples to (or delete) #{__FILE__}"
end