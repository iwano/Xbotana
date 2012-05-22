class PresentationsController < ApplicationController
 #before_filter :signed_in_user, only: [:new, :create, :show, :index, :edit, :update, :destroy]
 #before_filter :admin_user,     only: [:new, :create, :index, :edit, :update, :destroy]
  before_filter(only: [:new, :create, :show, :index, :edit, :update, :destroy]) do |controller|
   controller.send(:signed_in_user) unless controller.request.format.json? || controller.request.format.xml?
  end
  before_filter(only: [:new, :create, :edit, :update, :destroy]) do |controller|
   controller.send(:admin_user) unless controller.request.format.json? || controller.request.format.xml?
  end
  
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
    if session[:mobile_param] ==0
      @products = @presentation.products.paginate(page: params[:page])
    else
      @products = @presentation.products
    end
    
    respond_to do |format|
       format.html #show.html.erb
       format.json {render json: @presentation.as_json()}
       format.xml {render xml: @presentation.to_xml()}
     end
  end

  def index
    presentations = Presentation.all
    if session[:mobile_param] ==0
      @presentations = Presentation.paginate(page: params[:page])
    else
      @presentations = presentations
    end
    
    respond_to do |format|
       format.html #presentations.html.erb
       format.json {render json: @presentations.as_json()}
       format.xml {render xml: @presentations.to_xml({only: :name })}
     end
  end

  def destroy
    Presentation.find(params[:id]).destroy
    flash[:success] = "The presentation has been removed from the database."
    redirect_to presentations_path
  end
 
end