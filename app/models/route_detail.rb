# == Schema Information
#
# Table name: route_details
#
#  id         :integer         not null, primary key
#  route_id   :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  order_id   :integer
#

class RouteDetail < ActiveRecord::Base
  def as_json(options=nil)
    super(options ||
         {:include => { :order => {
            :include => { :user => {
              :only => :name}}, except:[:created_at, :updated_at, :id, :user_id]},
          :route => {
            :include => { :user => {
              :only => :name}}, except:[:created_at, :updated_at, :id, :user_id]}
              }, except:[:created_at, :updated_at, :id, :order_id, :route_id]})          
  end

  after_create :order_processed_email

  attr_accessible :route_id, :order_id
  
  belongs_to :route
  belongs_to :order
  
  validates :route_id, :order_id, presence: true

   private

    def order_processed_email
      UserMailer.order_processed(self).deliver
      UserMailer.order_processed_client(self).deliver
    end
end
