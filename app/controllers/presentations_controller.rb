class PresentationsController < ApplicationController
 before_filter :signed_in_user, only: [:new, :create, :show, :index, :edit, :update, :destroy]
 before_filter :admin_user,     only: [:new, :create, :index, :edit, :update, :destroy]
  def new
    @presentation = Presentation.new
  end

  def create
    @presentation = Presentation.new(params[:presentation])
     if @presentation.save
       flash[:success] = "The presentation has been added to the database."
       redirect_to presentations_path
     else
       render 'new'
     end
  end

  def show
    @presentation = Presentation.find(params[:id])
    @products = @presentation.products.paginate(page: params[:page])
    
    respond_to do |format|
       format.html #show.html.erb
       format.json {render json: @presentation}
     end
  end

  def index
    @presentations = Presentation.paginate(page: params[:page])
    presentations = Presentation.all
    
    respond_to do |format|
       format.html #presentations.html.erb
       format.json {render json: @presentations}
     end
  end

  def destroy
    Presentation.find(params[:id]).destroy
    flash[:success] = "The presentation has been removed from the database."
    redirect_to presentations_path
  end
 
end