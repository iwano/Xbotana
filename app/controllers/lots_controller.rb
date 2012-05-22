class LotsController < ApplicationController
 #before_filter :signed_in_user, only: [:new, :create, :index, :show, :edit, :update, :destroy]
 #before_filter :admin_user,     only: [:new, :create, :index, :edit, :update, :destroy]
 before_filter(only: [:new, :create, :show, :index, :edit, :update, :destroy]) do |controller|
   controller.send(:signed_in_user) unless controller.request.format.json? || controller.request.format.xml?
  end
  before_filter(only: [:new, :create, :edit, :update, :destroy]) do |controller|
   controller.send(:admin_user) unless controller.request.format.json? || controller.request.format.xml?
  end
  
 def new
   @lot = Lot.new
 end
 
 def create
   @lot = Lot.new(params[:lot])
    if @lot.save
      flash[:success] = "The lot has been added to the database."
      redirect_to lots_path
    else
      render 'new'
    end
 end
 
 def show
   @lot = Lot.find(params[:id])
   if session[:mobile_param] ==0
     @products = @lot.products.paginate(page: params[:page])
   else
     @products = @lot.products
   end
   respond_to do |format|
      format.html #show.html.erb
      format.json {render json: @lot.as_json()}
      format.xml {render xml: @lot.to_xml()}
    end
 end
 
 def index
   lots = Lot.all
   if session[:mobile_param] ==0
    @lots = Lot.paginate(page: params[:page])
   else
    @lots = lots
   end
   
   respond_to do |format|
      format.html #lots.html.erb
      format.json {render json: lots.as_json()}
      format.xml {render xml: lots.to_xml({only: [:number, :expiry_date] })}
    end
 end
 
 def destroy
   Lot.find(params[:id]).destroy
   flash[:success] = "The lot has been removed from the database."
   redirect_to lots_path
 end
 
end