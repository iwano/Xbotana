class OrderDetailsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  before_filter :admin_user,     only: [:new, :create, :index, :edit, :update, :destroy]
  def new
  end
  
  def create
  end
  
  def show
  end
  
  def index
    @order_details = OrderDetail.paginate(page: params[:page])
    od = OrderDetail.all
   
    respond_to do |format|
      format.html #order_details.html.erb
      format.json {render json: od}
      format.xml {render xml: od}
    end
  end
end
