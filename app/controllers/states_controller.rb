class StatesController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :show, :index, :edit, :update, :destroy]
  before_filter :admin_user,     only: [:new, :create, :index, :edit, :update, :destroy]
   
  def new
    @state = State.new
  end
  
  def index 
    @states = State.paginate(page: params[:page])
    states = State.all
    
    respond_to do |format|
      format.html #states.html.erb
      format.json {render json: states}
    end
  end
  
  def create
    @state = State.new(params[:state])
     if @state.save
       flash[:success] = "The state has been added to the database."
       redirect_to states_path
     else
       render 'new'
     end
  end
  
  def show
    @state = State.find(params[:id])
    @cities = @state.cities.paginate(page: params[:page])
    
    respond_to do |format|
      format.html #show.html.erb
      format.json {render json: @state}
    end
  end
  
  def destroy
    State.find(params[:id]).destroy
    flash[:success] = "The state has been removed from the database."
    redirect_to states_path
  end
  
  def edit
    @state = State.find(params[:id])
  end
  
  def update
     @state = State.find(params[:id])
     if @state.update_attributes(params[:state])
       flash[:success] = "State updated"
       redirect_to states_path
     else
       render 'edit'
     end
   end
  
end