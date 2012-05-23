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
    od = OrderDetail.all
    if !session[:mobile_param] || session[:mobile_param] =="0"
      @order_details = OrderDetail.paginate(page: params[:page])
    else
      @order_details = od
    end
   
    respond_to do |format|
      format.html #order_details.html.erb
      format.json {render json: od}
      format.xml {render xml: od}
    end
  end
end
