class CitiesController < ApplicationController
 before_filter :signed_in_user, only: [:new, :create, :index, :edit, :update, :destroy]
 before_filter :admin_user,     only: [:new, :create, :index, :edit, :update, :destroy]
 
  def new
    @city = City.new
  end
  
  def show
  end
  
  def create
    @city = City.new(params[:city])
    render  "new"
  end
  
  def destroy
  end
  
end