class CitiesController < ApplicationController
 #before_filter :signed_in_user, only: [:new, :create, :show, :index, :edit, :update, :destroy]
 #before_filter :admin_user,     only: [:new, :create, :index, :edit, :update, :destroy]
 before_filter(only: [:new, :create, :show, :index, :edit, :update, :destroy]) do |controller|
   controller.send(:signed_in_user) unless controller.request.format.json? || controller.request.format.xml?
 end
  before_filter(only: [:new, :create, :edit, :update, :destroy]) do |controller|
   controller.send(:admin_user) unless controller.request.format.json? || controller.request.format.xml?
  end

  def new
    @city = City.new
  end
  
  def show
    @city = City.find(params[:id])
    
    respond_to do |format|
      format.html #show.html.erb
      format.json {render json: @city.as_json()}
      format.xml {render xml: @city.to_xml()}
    end
  end
  
  def index
    cities = City.all
    if !session[:mobile_param] || session[:mobile_param] =="0"
      @cities = City.paginate(page: params[:page])
    else
      @cities = cities
    end
    
    respond_to do |format|
      format.html #cities.html.erb
      format.json {render json: cities.as_json()}
      format.xml {render xml: cities.to_xml(:include => { :state => { :only => :name }},  
          only: :name)}
    end
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