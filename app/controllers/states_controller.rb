class StatesController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :index, :edit, :update, :destroy]
  before_filter :admin_user,     only: [:new, :create, :index, :edit, :update, :destroy]
   
  def new
    @state = State.new
  end
  
  def show
  end
  
  def create
    @state = State.new(params[:state])
    render 'new'
  end
  
  def destroy
  end
    
end