# == Schema Information
#
# Table name: states
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe State do
  before do
    @state = State.new(name: "Colima")
  end
  
  subject { @state }

  it { should respond_to(:name) }
  
  it { should be_valid }
  
  describe "when name is not present" do
    before { @state.name = " " }
    it { should_not be_valid }
  end
end