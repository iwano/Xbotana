class RoutesController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  before_filter :hos_user, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  
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
     @routes = Route.paginate(page: params[:page])
  end
  
  def destroy
    Route.find(params[:id]).destroy
    flash[:success] = "The route has been removed from the database."
    redirect_to routes_path
  end
  
end
