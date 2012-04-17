class CitiesController < ApplicationController
 before_filter :signed_in_user, only: [:new, :create, :show, :index, :edit, :update, :destroy]
 before_filter :admin_user,     only: [:new, :create, :index, :edit, :update, :destroy]
 
  def new
    @city = City.new
  end
  
  def show
    @city = City.find(params[:id])
  end
  
  def index
    @cities = City.paginate(page: params[:page])
  end
  
  def create
    @city = City.new(params[:city])
     if @city.save
       flash[:success] = "The city has been added to the database."
       redirect_to cities_path
     else
       render 'new'
     end
  end
  
  def destroy
    City.find(params[:id]).destroy
    flash[:success] = "The city has been removed from the database."
    redirect_to cities_path
  end
  
  def edit
    @city = City.find(params[:id])
  end
  
  def update
    @city = City.find(params[:id])
    if @city.update_attributes(params[:city])
      flash[:success] = "City updated"
      redirect_to cities_path
    else
      render 'edit'
    end
  end
  
end