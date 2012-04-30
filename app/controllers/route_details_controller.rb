class RouteDetailsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  before_filter :hos_user, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  
  def deliver
    
  end
  
  def new
    @route_detail = RouteDetail.new
    @route = params[:route_id]
    @orders = Order.where(:status=>"processing") 
  end
  
  def create
    @route_detail = RouteDetail.new(params[:route_detail])
    r = params[:route_detail][:route_id]
    if @route_detail.save
      @route_detail.order.update_attributes(:status => "On its way")
      flash[:success] = "The stop has been added to the route."
      redirect_to "/routes/#{r}"
    else
      render 'new'
    end
  end
  
  def destroy
    route = RouteDetail.find(params[:id])
    path = route.route.id
    route.destroy
    route.order.update_attributes(:status => "processing")
    flash[:success] = "The stop has been removed from the route."
    redirect_to "/routes/#{path}"
  end
end
