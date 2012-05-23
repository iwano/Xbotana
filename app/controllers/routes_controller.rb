class RoutesController < ApplicationController
  #before_filter :signed_in_user, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  #before_filter :hos_vendor_admin_user, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  before_filter(only: [:new, :create, :show, :index, :edit, :update, :destroy]) do |controller|
   controller.send(:signed_in_user) unless controller.request.format.json? || controller.request.format.xml?
  end
  before_filter(only: [:new, :create, :show, :index, :edit, :update, :destroy]) do |controller|
   controller.send(:hos_vendor_admin_user) unless controller.request.format.json? || controller.request.format.xml?
  end

  def new
    @route = Route.new
    @users = User.vendors
  end
  
  def create
    @route = Route.new(params[:route])
    if @route.save
      flash[:success] = "The route has been added to the database."
      redirect_to routes_path
    else
      render 'new'
    end
  end
  
  def index
    id = current_user.id
    if !session[:mobile_param] || session[:mobile_param] =="0"
      @routes = current_user.vendor ?  Route.where(:user_id=>id).paginate(page: params[:page]) : Route.paginate(page: params[:page])
    else
      @routes = current_user.vendor ?  Route.where(:user_id=>id) : Route.all
    end
     respond_to do |format|
         format.html #index.html.erb
         format.json {render json: @routes.as_json()}
         format.xml {render xml: @routes.to_xml({:include => { :user => { :only => :name }}, 
          except:[:created_at, :updated_at, :id]})}
      end
  end
  
  def destroy
    Route.find(params[:id]).destroy
    flash[:success] = "The route has been removed from the database."
    redirect_to routes_path
  end
  
  def show
    @route = Route.find(params[:id])
    if current_user.vendor?
      @route_details = get_undelivered_orders(@route)
    else
      @route_details = @route.route_details
      @route_detail = RouteDetail.new
    end
     respond_to do |format|
         format.html #show.html.erb
         format.json {render json: @route_details.as_json()}
         format.xml {render xml: @route_details.to_xml({:include => { :order => {
            :include => { :user => {
              :only => :name}}, except:[:created_at, :updated_at, :id, :user_id]},
          :route => {
            :include => { :user => {
              :only => :name}}, except:[:created_at, :updated_at, :id, :user_id]}
              }, except:[:created_at, :updated_at, :id, :order_id, :route_id]})}
      end
  end
  
end
