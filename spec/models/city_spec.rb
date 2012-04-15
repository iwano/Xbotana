# == Schema Information
#
# Table name: cities
#
#  id         :integer         not null, primary key
#  state_id   :integer
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe City do
  before do
    @city = City.new(name: "Colima", state_id: "1")
  end
  
  subject { @city }

  it { should respond_to(:name) }
  it { should respond_to(:state_id) }
  
  it { should be_valid }
  
  describe "when name is not present" do
    before { @city.name = " " }
    it { should_not be_valid }
  end
  
  describe "when email is not present" do
    before { @city.state_id = " " }
    it { should_not be_valid }
  end
end
