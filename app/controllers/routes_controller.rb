class RoutesController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  before_filter :hos_vendor_admin_user, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  
  def new
    @route = Route.new
    @users = User.where(:vendor=>true)
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
    @routes = current_user.vendor ?  Route.where(:user_id=>id).paginate(page: params[:page]) : Route.paginate(page: params[:page])
     respond_to do |format|
         format.html #index.html.erb
         format.json {render json: @routes}
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
         format.json {render json: @route_details}
      end
  end
  
end
