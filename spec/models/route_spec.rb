# == Schema Information
#
# Table name: routes
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  finished   :boolean         default(TRUE)
#

require 'spec_helper'

describe Route do
  pending "add some examples to (or delete) #{__FILE__}"
end
