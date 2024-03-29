class RouteDetailsController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  before_filter :hos_user, only: [:new, :create, :show, :edit, :update, :destroy]
  
  def deliver
    @order = Order.find(params[:order_id])
    @order.update_attributes(:status => "delivered", :delivered_date => Time.now)
    ordr = @order.route_details
    id = ordr[0].route.id
    check_finished_route(id)
    flash[:success] = "Order delivered :)"
    redirect_to "/routes/#{id}"
  end
  
  def new
    @route_detail = RouteDetail.new
    @route = params[:route_id]
    @orders = Order.processing
  end
  
  def create
    @route_detail = RouteDetail.new(params[:route_detail])
    r = params[:route_detail][:route_id]
    if @route_detail.save
      @route_detail.order.update_attributes(:status => "on its way")
      Route.find(r).update_attribute(:finished, false)
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

  def index
    @route_details = RouteDetail.paginate(page: params[:page])
    rd = RouteDetail.all
   
    respond_to do |format|
      format.html #order_details.html.erb
      format.json {render json: rd.as_json()}
      format.xml {render xml: rd.to_xml({:include => { :order => {
            :include => { :user => {
              :only => :name}}, except:[:created_at, :updated_at, :id, :user_id]},
          :route => {
            :include => { :user => {
              :only => :name}}, except:[:created_at, :updated_at, :id, :user_id]}
              }, except:[:created_at, :updated_at, :id, :order_id, :route_id]})}
    end
  end
end
