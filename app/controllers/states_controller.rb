class StatesController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :index, :edit, :update, :destroy]
  before_filter :admin_user,     only: [:new, :create, :index, :edit, :update, :destroy]
   
  def new
    @state = State.new
  end
  
  def index 
    @states = State.paginate(page: params[:page])
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
  end
  
  def destroy
    State.find(params[:id]).destroy
    flash[:success] = "The state has been removed from the database."
    redirect_to states_path
  end
end